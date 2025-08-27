import argparse

def get_args():
    parser = argparse.ArgumentParser(description="Parses BLAST results and gene annotation files to find reciprocal best hits between two species.")
    parser.add_argument(
        '--blast1',
        required=True,
        help="Path to the BLAST results file for species 1.\n(Sorted by query ID, then e-value)"
    )
    parser.add_argument(
        '--blast2',
        required=True,
        help="Path to the BLAST results file for species 2.\n(Sorted by query ID, then e-value)"
    )
    parser.add_argument(
        '--biomart1',
        required=True,
        help="Path to the gene/protein mapping file for species 1.\n(Format: GeneID <tab> ProteinID <tab> GeneName)"
    )
    parser.add_argument(
        '--biomart2',
        required=True,
        help="Path to the gene/protein mapping file for species 2.\n(Format: GeneID <tab> ProteinID <tab> GeneName)"
    )
    parser.add_argument(
        '--output',
        '-o',
        required=True,
        help="Path for the output file to save results."
    )
    return parser.parse_args()

args = get_args()


biomart_species1 = {}
biomart_species2 = {}

with open(args.biomart1, 'r') as f_in1, open(args.biomart2, 'r') as f_in2:
    for line in f_in1:
        columns = line.strip().split('\t')
        if len(columns) != 3:
            continue
        gene_id, protein_id, gene_name = columns
        biomart_species1[protein_id] = [gene_id, gene_name]

    for line in f_in2:
        columns = line.strip().split('\t')
        if len(columns) != 3:
            continue
        gene_id, protein_id, gene_name = columns
        biomart_species2[protein_id] = [gene_id, gene_name]

species1_hits = {}
species2_hits = {}

with open(args.blast1, 'r') as f_in1, open(args.blast2, 'r') as f_in2:
    # Process BLAST results for species 1
    skipped_gene = ""
    for line in f_in1:
        columns = line.strip().split('\t')
        # Ensure the line has enough columns to prevent index errors
        if len(columns) < 11:
            continue
        
        gene1 = columns[0]
        if gene1 == skipped_gene:
            continue
        
        gene2 = columns[1]
        try:
            evalue = float(columns[10])
        except ValueError:
            # Skip lines where e-value is not a valid float
            continue

        if gene1 not in species1_hits:
            # First time seeing this gene, so this is its best hit
            species1_hits[gene1] = [[gene2], [evalue]]
        else:
            # This gene already has a recorded best hit
            if evalue == species1_hits[gene1][1][0]:
                # Tie for the best hit, add this hit as well
                species1_hits[gene1][0].append(gene2)
                species1_hits[gene1][1].append(evalue)
            else:
                # This hit is worse than the best one found so far.
                # Since the file is sorted, all subsequent hits for this gene are also worse.
                skipped_gene = gene1
    
    # Process BLAST results for species 2
    skipped_gene = ""
    for line in f_in2:
        columns = line.strip().split('\t')
        if len(columns) < 11:
            continue

        gene1 = columns[0]
        if gene1 == skipped_gene:
            continue

        gene2 = columns[1]
        try:
            evalue = float(columns[10])
        except ValueError:
            continue

        if gene1 not in species2_hits:
            species2_hits[gene1] = [[gene2], [evalue]]
        else:
            if evalue == species2_hits[gene1][1][0]:
                species2_hits[gene1][0].append(gene2)
                species2_hits[gene1][1].append(evalue)
            else:
                skipped_gene = gene1
    
    reciprocal_count = 0
    with open(args.output, 'w') as f_out:
        for gene_species_1, value in species1_hits.items():
            # Condition 1: Check if there's only one unique best hit for the gene from species 1
            if len(value[0]) != 1:
                continue
            
            gene_species_2 = value[0][0]

            # Check if the best hit from species 1 even exists as a query in species 2's results
            if gene_species_2 not in species2_hits:
                continue

            # Condition 2: Check if there's only one unique best hit for that corresponding gene in species 2
            if len(species2_hits[gene_species_2][0]) != 1:
                continue
            
            # Condition 3: Check for reciprocity
            # Is the best hit for gene_species_2 the original gene_species_1?
            if species2_hits[gene_species_2][0][0] == gene_species_1:
                # This is a reciprocal best hit pair.
                
                # Retrieve annotation info, with checks for missing keys
                info1 = biomart_species1.get(gene_species_1)
                info2 = biomart_species2.get(gene_species_2)

                if not info1 or not info2:
                    # Skip if we can't find the annotation for either protein
                    continue

                species1_gene_id = info1[0]
                species1_protein_id = gene_species_1
                species1_gene_name = info1[1]

                species2_gene_id = info2[0]
                species2_protein_id = gene_species_2
                species2_gene_name = info2[1]

                # Format and write the output line
                output_line = (
                    f"{species1_gene_id}\t{species1_protein_id}\t{species1_gene_name}\t"
                    f"{species2_gene_id}\t{species2_protein_id}\t{species2_gene_name}\n"
                )
                f_out.write(output_line)
                reciprocal_count += 1
    
    print(f"Found and wrote {reciprocal_count} reciprocal best hit pairs to {output_path}.")
    print("\nDone.")


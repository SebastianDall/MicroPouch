rule  SubSampleFastq:
    input:
        R1      = OUT_DIR+"{barcode}/{barcode}_R1_NonHuman_Combined.fastq.gz",
        R2      = OUT_DIR+"{barcode}/{barcode}_R2_NonHuman_Combined.fastq.gz"
    params:
        SubSampleNo   = CUTOFF,
        SubSampleSeet = SEQTK_SEED,
    threads:
        1
    output:
        R1      = OUT_DIR+"{barcode}/{barcode}_R1_NonHuman_Combined_Subsampled_"+str(CUTOFF)+".fastq.gz",
        R2      = OUT_DIR+"{barcode}/{barcode}_R2_NonHuman_Combined_Subsampled_"+str(CUTOFF)+".fastq.gz"
    conda:
        "../_envs/seqtk.yaml"
    shell:
        '''
        seqtk sample -s{params.SubSampleSeet} {input.R1} {params.SubSampleNo} \
        | gzip > {output.R1} && \
        seqtk sample -s{params.SubSampleSeet} {input.R2} {params.SubSampleNo} \
        | gzip > {output.R2}
        '''

#!/usr/bin/env cwl-runner
#

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, index]

doc: "samtools index"

hints:
  DockerRequirement:
    dockerPull: quay.io/ucsc_cgl/samtools

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing: 
      - $(inputs.bam)


inputs:

  bam:
    type: File
    inputBinding:
      position: 1

outputs:

  out_index:
    type: File
    outputBinding:
      glob: $(inputs.bam.basename)
    secondaryFiles:
      - .bai

arguments:
  - valueFrom: $(inputs.bam.basename + ".bai")
    position: 2
# scatacseq

Related files:
- [🔬 Background doc](https://docs.google.com/document/d/1Lrzruebio9nUusaFSJQlZGANkRjS5lrJmk4W0sSj_xM/edit): More details about this type.
- [📝 TSV template](https://raw.githubusercontent.com/hubmapconsortium/ingest-validation-tools/master/docs/scatacseq/template.tsv): Use this to submit metadata.
- [💻 Source code](https://github.com/hubmapconsortium/ingest-validation-tools/edit/master/src/ingest_validation_tools/table-schemas/level-2/scatacseq.yaml): Make a PR if this doc should be updated.

## Table of contents
<details><summary>Provenance</summary>

[`donor_id`](#donor_id)<br>
[`tissue_id`](#tissue_id)<br>
</details>

<details><summary>Level 1</summary>

[`execution_datetime`](#execution_datetime)<br>
[`protocols_io_doi`](#protocols_io_doi)<br>
[`operator`](#operator)<br>
[`operator_email`](#operator_email)<br>
[`pi`](#pi)<br>
[`pi_email`](#pi_email)<br>
[`assay_category`](#assay_category)<br>
[`assay_type`](#assay_type)<br>
[`analyte_class`](#analyte_class)<br>
[`is_targeted`](#is_targeted)<br>
</details>

<details><summary>Level 2</summary>

[`acquisition_instrument_vendor`](#acquisition_instrument_vendor)<br>
[`acquisition_instrument_model`](#acquisition_instrument_model)<br>
[`is_technical_replicate`](#is_technical_replicate)<br>
[`library_id`](#library_id)<br>
[`sc_isolation_protocols_io_doi`](#sc_isolation_protocols_io_doi)<br>
[`sc_isolation_entity`](#sc_isolation_entity)<br>
[`sc_isolation_tissue_dissociation`](#sc_isolation_tissue_dissociation)<br>
[`sc_isolation_enrichment`](#sc_isolation_enrichment)<br>
[`sc_isolation_quality_metric`](#sc_isolation_quality_metric)<br>
[`sc_isolation_cell_number`](#sc_isolation_cell_number)<br>
[`transposition_input`](#transposition_input)<br>
[`transposition_method`](#transposition_method)<br>
[`transposition_transposase_source`](#transposition_transposase_source)<br>
[`transposition_kit_number`](#transposition_kit_number)<br>
[`library_construction_protocols_io_doi`](#library_construction_protocols_io_doi)<br>
[`library_layout`](#library_layout)<br>
[`library_adapter_sequence`](#library_adapter_sequence)<br>
[`cell_barcode_read`](#cell_barcode_read)<br>
[`cell_barcode_offset`](#cell_barcode_offset)<br>
[`cell_barcode_size`](#cell_barcode_size)<br>
[`library_pcr_cycles`](#library_pcr_cycles)<br>
[`library_pcr_cycles_for_sample_index`](#library_pcr_cycles_for_sample_index)<br>
[`library_final_yield`](#library_final_yield)<br>
[`library_final_yield_unit`](#library_final_yield_unit)<br>
[`library_average_fragment_size`](#library_average_fragment_size)<br>
[`sequencing_reagent_kit`](#sequencing_reagent_kit)<br>
[`sequencing_read_format`](#sequencing_read_format)<br>
[`sequencing_read_percent_q30`](#sequencing_read_percent_q30)<br>
[`sequencing_phix_percent`](#sequencing_phix_percent)<br>
</details>

<details><summary>Paths</summary>

[`metadata_path`](#metadata_path)<br>
[`data_path`](#data_path)<br></details>

## Provenance

### `donor_id`
HuBMAP Display ID of the donor of the assayed tissue.

| constraint | value |
| --- | --- |
| pattern | `[A-Z]+[0-9]+` |
| required | `True` |

### `tissue_id`
HuBMAP Display ID of the assayed tissue.

| constraint | value |
| --- | --- |
| pattern | `([A-Z]+[0-9]+)-(BL|BR|LB|RB|HT|LK|RK|LI|LV|LL|RL|LY\d\d|SI|SP|TH|TR|UR|OT)(-\d+)+(_\d+)?` |
| required | `True` |

## Level 1

### `execution_datetime`
Start date and time of assay, typically a date-time stamped folder generated by the acquisition instrument. YYYY-MM-DD hh:mm, where YYYY is the year, MM is the month with leading 0s, and DD is the day with leading 0s, hh is the hour with leading zeros, mm are the minutes with leading zeros.

| constraint | value |
| --- | --- |
| type | `datetime` |
| format | `%Y-%m-%d %H:%M` |
| required | `True` |

### `protocols_io_doi`
DOI for protocols.io referring to the protocol for this assay.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern | `10\.17504/.*` |

### `operator`
Name of the person responsible for executing the assay.

| constraint | value |
| --- | --- |
| required | `True` |

### `operator_email`
Email address for the operator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

### `pi`
Name of the principal investigator responsible for the data.

| constraint | value |
| --- | --- |
| required | `True` |

### `pi_email`
Email address for the principal investigator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

### `assay_category`
Each assay is placed into one of the following 3 general categories: generation of images of microscopic entities, identification & quantitation of molecules by mass spectrometry, and determination of nucleotide sequence.

| constraint | value |
| --- | --- |
| enum | `sequence` |
| required | `True` |

### `assay_type`
The specific type of assay being executed.

| constraint | value |
| --- | --- |
| enum | `SNARE-seq2`, `scATACseq`, `sciATACseq`, or `snATACseq` |
| required | `True` |

### `analyte_class`
Analytes are the target molecules being measured with the assay.

| constraint | value |
| --- | --- |
| enum | `DNA` |
| required | `True` |

### `is_targeted`
Specifies whether or not a specific molecule(s) is/are targeted for detection/measurement by the assay. The CODEX analyte is protein.

| constraint | value |
| --- | --- |
| type | `boolean` |
| required | `True` |

## Level 2

### `acquisition_instrument_vendor`
An acquisition_instrument is the device that contains the signal detection hardware and signal processing software. Assays can generate signals such as light of various intensities or color or signals representing molecular mass.

| constraint | value |
| --- | --- |
| required | `True` |

### `acquisition_instrument_model`
Manufacturers of an acquisition instrument may offer various versions (models) of that instrument with different features or sensitivities. Differences in features or sensitivities may be relevant to processing or interpretation of the data.

| constraint | value |
| --- | --- |
| required | `True` |

### `is_technical_replicate`
If TRUE, fastq files in dataset need to be merged.

| constraint | value |
| --- | --- |
| type | `boolean` |
| required | `True` |

### `library_id`
A library ID, unique within a TMC, which allows corresponding RNA and chromatin accessibility datasets to be linked.

| constraint | value |
| --- | --- |
| required | `True` |

### `sc_isolation_protocols_io_doi`
Link to a protocols document answering the question: How were single cells separated into a single-cell suspension?

| constraint | value |
| --- | --- |
| required | `True` |
| pattern | `10\.17504/.*` |

### `sc_isolation_entity`
The type of single cell entity derived from isolation protocol.

| constraint | value |
| --- | --- |
| enum | `whole cell`, `nucleus`, `cell-cell multimer`, or `spatially encoded cell barcoding` |
| required | `True` |

### `sc_isolation_tissue_dissociation`
The method by which tissues are dissociated into single cells in suspension.

| constraint | value |
| --- | --- |
| required | `True` |

### `sc_isolation_enrichment`
The method by which specific cell populations are sorted or enriched.

| constraint | value |
| --- | --- |
| enum | `none` or `FACS` |
| required | `True` |

### `sc_isolation_quality_metric`
A quality metric by visual inspection prior to cell lysis or defined by known parameters such as wells with several cells or no cells. This can be captured at a high level. "OK" or "not OK", or with more specificity such as "debris", "clump", "low clump".

| constraint | value |
| --- | --- |
| required | `True` |

### `sc_isolation_cell_number`
Total number of cell/nuclei yielded post dissociation and enrichment.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

### `transposition_input`
Number of cell/nuclei input to the assay.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

### `transposition_method`
Modality of capturing accessible chromatin molecules.

| constraint | value |
| --- | --- |
| enum | `SNARE-Seq2-AC`, `scATACseq`, `bulkATACseq`, `snATACseq`, or `sciATACseq` |
| required | `True` |

### `transposition_transposase_source`
The source of the Tn5 transposase and transposon used for capturing accessible chromatin.

| constraint | value |
| --- | --- |
| enum | `10X snATAC`, `In-house`, or `Nextera` |
| required | `True` |

### `transposition_kit_number`
If Tn5 came from a kit, provide the catalog number. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| required | `False` |

### `library_construction_protocols_io_doi`
A link to the protocol document containing the library construction method (including version) that was used, e.g. "Smart-Seq2", "Drop-Seq", "10X v3". DOI for protocols.io referring to the protocol for this assay.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern | `10\.17504/.*` |

### `library_layout`
Whether the library was generated for single-end or paired end sequencing.

| constraint | value |
| --- | --- |
| enum | `single-end` or `paired-end` |
| required | `True` |

### `library_adapter_sequence`
Adapter sequence to be used for adapter trimming.

| constraint | value |
| --- | --- |
| pattern | `[ATCG]+(\+[ATCG]+)?` |
| required | `True` |

### `cell_barcode_read`
Which read file contains the cell barcode.

| constraint | value |
| --- | --- |
| required | `True` |

### `cell_barcode_offset`
Positions in the read at which the cell barcodes start. Cell barcodes are, for example, 3 x 8 bp sequences that are spaced by constant sequences (the offsets). First barcode at position 0, then 38, then 76. (Does not apply to SNARE-seq and BulkATAC.)

| constraint | value |
| --- | --- |
| pattern | `\d+(,\d+)*` |
| required | `True` |

### `cell_barcode_size`
Length of the cell barcode in base pairs. Cell barcodes are, for example, 3 x 8 bp sequences that are spaced by constant sequences, the offsets. (Does not apply to SNARE-seq and BulkATAC.)

| constraint | value |
| --- | --- |
| pattern | `\d+(,\d+)*` |
| required | `True` |

### `library_pcr_cycles`
Number of PCR cycles to enrich for accessible chromatin fragments.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

### `library_pcr_cycles_for_sample_index`
Number of PCR cycles performed for library generation (figure in Descriptions section)

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

### `library_final_yield`
Total ng of library after final pcr amplification step.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

### `library_final_yield_unit`
Units for library_final_yield

| constraint | value |
| --- | --- |
| enum | `ng` |
| required | `True` |

### `library_average_fragment_size`
Average size of sequencing library fragments estimated via gel electrophoresis or bioanalyzer/tapestation. Numeric value in bp.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

### `sequencing_reagent_kit`
Reagent kit used for sequencing. NovaSeq6000 for example

| constraint | value |
| --- | --- |
| required | `True` |

### `sequencing_read_format`
Number of sequencing cycles in Read1, i7 index, i5 index, and Read2. Eg: for 10X snATAC-seq: 50+8+16+50 (R1,Index,R2,R3). For SNARE-seq2: 75+94+8+75

| constraint | value |
| --- | --- |
| required | `True` |

### `sequencing_read_percent_q30`
Percent of bases with Quality scores above Q30.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |
| minimum | `0` |
| maximum | `100` |

### `sequencing_phix_percent`
Percent PhiX loaded to the run.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |
| minimum | `0` |
| maximum | `100` |

## Paths

### `metadata_path`
Relative path to file or directory with free-form or instrument/lab specific metadata. Optional. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| required | `False` |

### `data_path`
Relative path to file or directory with instrument data. Downstream processing will depend on filename extension conventions.

| constraint | value |
| --- | --- |
| required | `True` |
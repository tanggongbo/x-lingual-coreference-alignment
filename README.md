# Cross-lingual coreference chain alignment project

This repository keeps the aligned cross-lingual coreference chains of the [ParCorFull](https://github.com/chardmeier/parcor-full/tree/master/corpus) corpus. (only the German-English language pair)

**Note: This version still has a set (185) of coreference chains need to checked by more professional annotators, which is stored in the** _anno.4checking.txt_.


## Motivation
ParCorFull is a parallel corpus annotated for coreference. However, the annotated coreference chains are independent between languages, i.e., they are not annotated jointly. It is still challenging to conduct research in the cross-lingual perspective. Thus, I attempt to align the coreference chains from German and English. 

## Toolkits
To better accord with the alignment annotation, I revised the [MMAX2 toolkit](https://github.com/ottiram/MMAX2) so that the interface can show the specified coreference chain IDs instead of reset by the MMAX2 toolkit. 

## Methdology
It is very challenging to align these coreference chains. In the original ParCorFull corpus, many mention boundaries are not consistent cross languages, and not every chain has a corresponding chain in the other language. 
The coreference chains alignment is annotated by both auomatic methods and human. 

### Main steps to align those coreference chains:
1. Generate mention representations from pre-trained coreference resolution models.
2. Compute cosine similarity scores among mentions in coreference chains. 
3. Align coreference chains based on a voting mechanism. 
4. Bidirectional alignment, selecting the intersection as the final alignment.  
5. manual annotation based on the outputs of the automatic method (Steps 1-4)

### The description of coreference chain IDs. 
The first digit of coreference chain IDs has different meaning, which is illustrated in the following table:
| ID_Prefix | Types | Notes
|:---------:|:--------------|:----------------------|
|1 |aligned clusters  |automatically generated |
|2 |unaligned source clusters |automatically generated |
|3 |unaligned target clusters |automatically generated |
|4 |aligned clusters  |manually generated |
|5 |unaligned source clusters |manually generated |
|6 |unaligned target clusters |manually generated |
|7 |clusters need to be revised or checked || 
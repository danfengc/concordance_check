## VCF / GWAS concordance
## Part 2


## GOAL:

## ---- Reading in the VCF and outputting PLINK file
## ---- downloading ricopili

## ---- Updating IDs in .fam file

## - double check information in new genotype data VCF file

## --- sub-sampling individuals
## --- Checking SNPs
## --- sub-sampling SNPs

## Checking single sample intensity from a VCF file

## -- cleaning up NA12878
## ===== Filter files and put in rp directories

## --- Running QC in Ricopili

## 3 - genotype discrepancies

## --- Relatedness comparison: reading in combined genome file




## =============== Checking single sample intensity from a VCF file


## - retrieve summary stats from both
## - allele freq / count
## - missingness
## - relatedness
## - heterozygosity


## New directory check:

## VCF:
/seq/tng/ggrant/3KCallSet/bestCallsetEver020817.final.vcf.gz

## genotypes
# /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych - OLD
# /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017 - OLD
/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_w2_2017

## analysis
/psych/genetics_data/howrigan/projects/sc_genotyping

## graphs
/home/unix/howrigan/private_html/psychchip/sc_genotyping

## read in VCF
use PLINK2
/home/unix/sripke/plink_src/plink_1.9_newest/plink








## --- checking zcall query


## Verneri's version of the Psych Chip scripts:
/humgen/atgu1/fs03/anttila/sharing/Daniel

# -rwxr--r--  1 anttila atgu 3.3K Feb 19 04:22 post1.command_list1.sh*
# -rwxr-xr-x  1 anttila atgu  14K Feb 19 04:22 standardizePlinkBfile.py*
# -rwxr-xr-x  1 anttila atgu  13K Feb 19 04:22 utils.py*
# drwxrwxrwx 30 anttila atgu  675 Feb 19 04:23 ../
# drwxrwxr-x  2 anttila atgu  156 Feb 19 04:30 ./
# -rwxr-xr-x  1 anttila atgu 131K Feb 19 04:30 PsychChip_DBS_exclude_list.txt*



# Jackie's script:

source /broad/software/scripts/useuse
reuse -q Python-2.7
reuse -q Perl-5.10
## Standardize plink files
python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized_gencall \
--bed scha3_v1.1-gencall.bed  \
--bim scha3_v1.1-gencall.bim  \
--fam scha3_v1.1-gencall.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update PGC_USA_wave4_pheno \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > scha3_Autocall.FHG19.log

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized_birdseed \
--bed scha3_v1.1-birdseed.bed \
--bim scha3_v1.1-birdseed.bim \
--fam scha3_v1.1-birdseed.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update PGC_USA_wave4_pheno \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > scha3_Birdseed.FHG19.log

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized_zcall \
--bed scha3_v1.1-zcall.bed \
--bim scha3_v1.1-zcall.bim \
--fam scha3_v1.1-zcall.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update PGC_USA_wave4_pheno \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > scha3_Zcall.FHG19.log


## Merge genotype calling algorithms
/psych/genetics_data/PsychChip/resources/mergecall_13 standardized_gencall.* standardized_birdseed.* standardized_zcall.* --out scha3_v1.1-merge

touch command_list.done



## ----- Verneri's version of the code

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out post1_Autocall.FHG19 \
--bed /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/beadstudio/Dutch_Posthuma_PsychChip_Autocall_AUTOCALL_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/beadstudio/Dutch_Posthuma_PsychChip_Autocall.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/beadstudio/Dutch_Posthuma_PsychChip_Autocall_AUTOCALL_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update post1_phenoupdate.txt \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > post1_Autocall.FHG19.log

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out post1_Birdseed.FHG19 \
--bed /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/birdseed/Dutch_Posthuma_PsychChip_Birdseed_BIRDSEED_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/birdseed/Dutch_Posthuma_PsychChip_Birdseed.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/birdseed/Dutch_Posthuma_PsychChip_Birdseed_BIRDSEED_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update post1_phenoupdate.txt \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > post1_Birdseed.FHG19.log

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out post1_Zcall.FHG19 \
--bed /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/zcall/Dutch_Posthuma_PsychChip_Zcall_ZCALL_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/zcall/Dutch_Posthuma_PsychChip_Zcall.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/psych_chip/dutch/zcall/Dutch_Posthuma_PsychChip_Zcall_ZCALL_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update post1_phenoupdate.txt \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > post1_Zcall.FHG19.log

## Merge genotype calling algorithms
/psych/genetics_data/PsychChip/resources/mergecall_13 post1_Autocall.FHG19.* post1_Birdseed.FHG19.* post1_Zcall.FHG19.* --out post1_merge

touch command_list1.done













## ================== Updated commands for COGS data ========================

## first create phenofile
fam_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych_AUTOCALL_.fam',stringsAsFactors=F)
pheno_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/phenofile/GPC_COGS_CAU_Psych.fam.pheno.txt',h=T,sep='\t')
sum(duplicated(fam_a$V1))

indx <- match(fam_a$V2,pheno_a$Collaborator.Participant.ID)
phe <- pheno_a$Case.Control.Status[indx]

phe_a <- cbind.data.frame(fam_a$V1,fam_a$V2,phe)
write.table(phe_a,'/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_Psych.phe',col=F,row=F,quo=F,sep='\t')



setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC')

## ----- Autocall

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized.autocall \
--bed /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych_AUTOCALL_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych_AUTOCALL_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_Psych.phe \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > GPC_COGS_CAU_Psych_AUTOCALL.FHG19.log

# This came up a lot:
# Warning: 256610 het. haploid genotypes present (see
# /broad/hptmp/howrigan/standardized_autocall_43QE7RMUVK/tmp10.hh ); many
# commands treat these as missing.

## ----- Birdseed

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized_birdseed \
--bed /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/birdseed/GPC_COGS_CAU_Psych_BIRDSEED_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/birdseed/GPC_COGS_CAU_Psych.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/birdseed/GPC_COGS_CAU_Psych_BIRDSEED_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_Psych.phe \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > GPC_COGS_CAU_Psych_BIRDSEED.FHG19.log

## ----- zcall

python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized_zcall \
--bed /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych_ZCALL_.FHG19.bed \
--bim /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych.FHG19.bim \
--fam /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych_ZCALL_.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--pheno-update /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_Psych.phe \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > GPC_COGS_CAU_Psych_ZCALL.FHG19.log

# using the scratch directory /broad/hptmp/howrigan/standardized_zcall_6QHK4PNCF1/
# bed: /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych_ZCALL_.FHG19.bed
# bim: /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych.FHG19.bim
# fam: /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/zcall/GPC_COGS_CAU_Psych_ZCALL_.fam
# numSamples: 3236
# numVariants: 603132

# [1] Updated the phenotype of 3199 samples from file /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_Psych.phe
# [2] Renamed 29 samples with duplicate ids
# [3] Removed 5 HapMap control samples from file /home/unix/jigold/hapmap_ids
# [4] Stripped manifest prefix from 8050 snps
# [5] Excluded 12968 snps from file /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt
# [6] Excluded 6913 snps not in file /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt
# [7] Updated the chromosome of 7767 snps from file /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt
# [8] Updated the position of 9063 snps from file /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt
# [9] Updated the name of 123 snps from file /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt

# nCases: 2404
# nControls: 795
# nUnknown: 32
# nVariants: 583251
# WARNING: Chromosome 24 has 1920 / 2321 snps remaining (chr is from original bim file)
# WARNING: Chromosome 26 has 320 / 422 snps remaining (chr is from original bim file)
# WARNING: Chromosome 0 has 7539 / 9139 snps remaining (chr is from original bim file)

# Final files are available here:
# Bed -- /psych/genetics_data/howrigan/projects/sc_genotyping/zcall/standardized_zcall.bed
# Bim -- /psych/genetics_data/howrigan/projects/sc_genotyping/zcall/standardized_zcall.bim
# Fam -- /psych/genetics_data/howrigan/projects/sc_genotyping/zcall/standardized_zcall.fam

grep NA12878 /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych_AUTOCALL_.fam
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6L	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6L	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-BZT6L	NA12878	N/A	N/A	2	N/A
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6L	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-A4KXK	NA12878	N/A	N/A	2	N/A
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6L	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6K	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6J	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A
# SM-BZT6I	NA12878	N/A	N/A	2	N/A


grep NA12878 standardized_birdseed.fam
# SM-BZT6J NA12878d N/A N/A 2 -9
# SM-BZT6I NA12878d N/A N/A 2 -9
# SM-BZT6I NA12878dd N/A N/A 2 -9
# SM-BZT6I NA12878ddd N/A N/A 2 -9
# SM-BZT6I NA12878dddd N/A N/A 2 -9
# SM-BZT6L NA12878d N/A N/A 2 -9
# SM-BZT6K NA12878d N/A N/A 2 -9
# SM-BZT6L NA12878dd N/A N/A 2 -9
# SM-BZT6J NA12878dd N/A N/A 2 -9
# SM-BZT6L NA12878ddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddd N/A N/A 2 -9
# SM-BZT6K NA12878dd N/A N/A 2 -9
# SM-BZT6K NA12878ddd N/A N/A 2 -9
# SM-BZT6J NA12878ddd N/A N/A 2 -9
# SM-BZT6J NA12878dddd N/A N/A 2 -9
# SM-BZT6I NA12878dddddd N/A N/A 2 -9
# SM-BZT6L NA12878dddd N/A N/A 2 -9
# SM-BZT6K NA12878dddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddddd N/A N/A 2 -9
# SM-BZT6I NA12878dddddddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddddddd N/A N/A 2 -9
# SM-BZT6I NA12878dddddddddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddddddddd N/A N/A 2 -9
# SM-BZT6I NA12878dddddddddddd N/A N/A 2 -9
# SM-BZT6K NA12878ddddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddddddddddd N/A N/A 2 -9
# SM-BZT6J NA12878ddddd N/A N/A 2 -9
# SM-BZT6I NA12878dddddddddddddd N/A N/A 2 -9
# SM-BZT6I NA12878ddddddddddddddd N/A N/A 2 -9


## ALERT: Pre-QC for Psych Chip doesn't get rid of all NA12878 samples


## Final merge step:

## Merge genotype calling algorithms
/psych/genetics_data/PsychChip/resources/mergecall_13 \
/psych/genetics_data/howrigan/projects/sc_genotyping/autocall/standardized.autocall.* \
/psych/genetics_data/howrigan/projects/sc_genotyping/birdseed/standardized.birdseed.* \
/psych/genetics_data/howrigan/projects/sc_genotyping/zcall/standardized.zcall.* \
--maf 0 --geno 1 --hwe 0 --mind 1 \
--out GPC_COGS_CAU_Psych_merge

## Not working for some reason....gonna try to do this all in the same directory

perl mergecall_13 standardized.autocall.* standardized.birdseed.* standardized.zcall.* --maf 0 --geno 1 --hwe 0 --mind 1 --out GPC_COGS_CAU_Psych_merge

## this worked...


## UPDATE with 2 callers (Birdseed removed)
perl mergecall_13 standardized.autocall.* standardized.zcall.* --maf 0 --geno 1 --hwe 0 --mind 1 --out GPC_COGS_CAU_Psych_2caller



# OPTIONS:
#      22  --out             output file root for PLINK files after merging (REQUIRED)
#      23  --help            print this text and exits
#      24  --maf             minor allele frequency cutoff for rare variants (default 0.01)
#      25  --maxmaf          max minor allele frequency for rare variants after zCall (default 0.05)
#      26  --geno            max missing rate for SNP for passing for zcall inclusion (default 0.03)
#      27  --hwe             hardy weinberg equilibrium p-value for zcall inclusion (default 1e-6)
#      28  --mind            per sample missing rate to be used in SNP quality calculations (default 0.05)
#      29  --cleanup         remove temporary files (default 0)
#      30  --loloc           log directory location (required if no ricopili.config file available)
#      31  --p2loc           PLINK-1.9 binary directory location (required if no ricopili.config file available)
#      32  --forcegencall    list of snps to force gencalls for
#      33  --forcebirdseed   list of snps to force birdseed calls for







## --- graphs of results







## ---- Reading in the VCF and outputting PLINK file

/home/unix/sripke/plink_src/plink_1.9_newest/plink --vcf /seq/tng/ggrant/3KCallSet/bestCallsetEver020817.final.vcf.gz \
--make-bed \
--allow-no-sex \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered

# PLINK v1.90b3.38 64-bit (7 Jun 2016)       https://www.cog-genomics.org/plink2
# (C) 2005-2016 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.log.
# Options in effect:
#   --allow-no-sex
#   --make-bed
#   --out /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered
#   --vcf /seq/tng/ggrant/3KCallSet/bestCallsetEver020817.final.vcf.gz

# 258264 MB RAM detected; reserving 129132 MB for main workspace.
# --vcf: 595k variants complete.
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered-temporary.bed
# +
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered-temporary.bim
# +
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered-temporary.fam
# written.
# 595652 variants loaded from .bim file.
# 3301 people (0 males, 0 females, 3301 ambiguous) loaded from .fam.
# Ambiguous sex IDs written to
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.nosex
# .
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 3301 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
# treat these as missing.
# Total genotyping rate is 0.996165.
# 595652 variants and 3301 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.bed
# +
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.bim
# +
# /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.fam
# ... done.
# 605.572u 27.208s 15:10.84 69.4%	0+0k 69828008+1988912io 4pf+0w




## ---- downloading ricopili


## first create new directory on Broad

/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp
/psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp

wget https://sites.google.com/a/broadinstitute.org/ricopili/download//rp_bin.Jul_2016b.tar.gz
tar -xvzf rp_bin.Jul_2016b.tar.gz
cd rp_bin/
./rp_config

## asked me to run these commands:
cat /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin/my.bashrc_rp_path >> ~/.my.bashrc
cat /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin/my.cshrc_rp_path >> ~/.my.cshrc
set path=(/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin $path)
set path=(/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin/pdfjam $path)
setenv rp_perlpackages /home/unix/sripke/perl_modules
./rp_config

## had to re-do ./rp_config because I didn't want my log files to go to my home directory
mkdir /home/unix/howrigan/rp_logs


## FINAL OUTPUT:
Creating pipeline status file to /home/unix/howrigan/rp_logs/preimp_dir_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/impute_dir_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/pcaer_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/idtager_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/repqc2_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/areator_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/merge_caller_info
Creating pipeline status file to /home/unix/howrigan/rp_logs/postimp_navi_info
Setup has been completed successfully!
If you do not receive an email with the subject rp_config, please check your email address is entered correctly at /home/unix/howrigan/ricopili.conf
-------------------------------------------------------------------
adding these commands to your ~/.bashrc can be very helpful
(just copy/paste the following lines into ~/.bashrc)
(you have to logout and login again for these to be in effect)

## for colored output of ls:
alias ls='ls --color=auto'

## for easy copy over to your local machine:
alias c='sed "s#.*#scp howrigan@gold.broadinstitute.org.broadinstitute.org:$(pwd)/& .#"'

## for list of cluster jobs:
alias q='qstat -u howrigan'

## different prompt:
PS1="howrigan@gold.broadinstitute.org.broadinstitute.org:"'\w'" "

-------------------------------------------------------------------


## Initial load up sequence (for Broad use)

Preferred directories used:

Detected you are using the following shell: tcsh

Required directories found in search path:
	rp_bin/ -- success
	rp_bin/pdfjam/ -- success

Detected pdflatex is installed.

Configuration file already exists at /home/unix/howrigan/ricopili.conf
Do you wish to overwrite this file? (y/n)
y
Rewriting configuration file. Making a backup to /home/unix/howrigan/ricopili.conf.copy

Do you want to use the following default scratch directory? (y or n)
	/broad/hptmp/howrigan/
y
Using /broad/hptmp/howrigan/ as the scratch directory.

Scratch directory already exists at /broad/hptmp/howrigan/

Please enter your initials (2 letters):
dh

Please enter your email address:
howrigan@broadinstitute.org

Do you want to use the following default directory to store your log files? (y or n)
	/home/unix/howrigan/
n
Please enter a log directory to use:
/home/unix/howrigan/rp_logs

You are running R on broad, took the default value

For Liftover, do you want to use the default location (y or n)?
	/home/unix/sripke/liftover/
Using /home/unix/sripke/liftover/ for Liftover.

For IMPUTE2, do you want to use the default location (y or n)?
	/psych/genetics_data/ripke/references_from_debakkerscratch/impute_v2/impute_v2/impute_2.2.7_beta/
Using /psych/genetics_data/ripke/references_from_debakkerscratch/impute_v2/impute_v2/impute_2.2.7_beta/ for IMPUTE2.

For PLINK2, do you want to use the default location (y or n)?
	/home/unix/sripke/plink_src/plink_1.9_newest/
Using /home/unix/sripke/plink_src/plink_1.9_newest/ for PLINK2.

For SHAPEIT, do you want to use the default location (y or n)?
	/home/unix/sripke/shapeit/
Using /home/unix/sripke/shapeit/ for SHAPEIT.

For HapMap reference, do you want to use the default location (y or n)?
	/psych/genetics_data/ripke/references_outdated/hapmap_ref/
Using /psych/genetics_data/ripke/references_outdated/hapmap_ref/ for HapMap reference.

For LDscore, do you want to use the default location (y or n)?
	/psych/genetics_data/ripke/ldsc/
Using /psych/genetics_data/ripke/ldsc/ for LDscore.

For Eigenstrat, do you want to use the default location (y or n)?
	/home/unix/sripke/eigensoft/bin
Using /home/unix/sripke/eigensoft/bin for Eigenstrat.

assuming library rmeta is installed on standard R

For EAGLE, do you want to use the default location (y or n)?
	/psych/genetics_data/ripke/rp_bins/Eagle_v2.2/
Using /psych/genetics_data/ripke/rp_bins/Eagle_v2.2/ for EAGLE.

For PLINK, do you want to use the default location (y or n)?
	/home/unix/sripke/plink_src/src/
Using /home/unix/sripke/plink_src/src/ for PLINK.

For METAL, do you want to use the default location (y or n)?
	/psych/genetics_data/ripke/references_from_debakkerscratch/metal/
Using /psych/genetics_data/ripke/references_from_debakkerscratch/metal/ for METAL.






## ---- Updating IDs in .fam file

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping')

## copied BestEverCallSet.csv to server
## appended .original to .fam file so I don't overwrite 

## read in conversion file
id <- read.csv('BestEverCallSet.csv',stringsAsFactors=F)
nrow(id) ## 3301

# pheno_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/phenofile/GPC_COGS_CAU_Psych.fam.pheno.txt',h=T,sep='\t',stringsAsFactors=F)
pheno_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_w2_2017/phenofile/GPC_COGS_CAU_Psych.fam.pheno.txt',h=T,sep='\t',stringsAsFactors=F)
dim(pheno_a) ## 3204
# fam_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych_AUTOCALL_.fam',stringsAsFactors=F)
fam_a <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge.fam',stringsAsFactors=F)
fam_v <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.fam.original',stringsAsFactors=F)

dim(fam_a) ## 3225
dim(fam_v) ## 3301

## connect VCF IDs
fam_v$CHIP_WELL_BARCODE <- paste0(fam_v$V1,'_',fam_v$V2)

## NA12878 in Autocall merged sample
fam_a[grep('NA12878',fam_a$V2),]
nrow(fam_a[grep('NA12878',fam_a$V2),]) ## 29 times
sum(!duplicated(fam_a$V1)) ## 3200

## Are there duplicated samples
sum(duplicated(fam_a$V1)) ## 25
sum(duplicated(fam_a$V2)) ## 14
sum(duplicated(fam_v$CHIP_WELL_BARCODE)) ## 0
fam_a[duplicated(fam_a$V1),]



## === match id to fam_v
indx <- match(fam_v$CHIP_WELL_BARCODE,id$CHIP_WELL_BARCODE)
## add in new IDs
fam_v$ID <- id$COLLABORATOR_PARTICIPANT_ID[indx]
fam_v$SAMPLE_ID <- id$SAMPLE_ID[indx]
fam_v$REPORTED_GENDER <- id$REPORTED_GENDER[indx]
fam_v$SEX <- 1
fam_v$SEX[fam_v$REPORTED_GENDER=='F'] <- 2

## === match pheno to fam_v
indx <- match(fam_v$ID,pheno_a$Collaborator.Participant.ID)
sum(is.na(indx)) ## 3
fam_v$AFF <- pheno_a$Case.Control.Status[indx]
fam_v[is.na(fam_v$AFF),]
#                V1     V2 V3 V4 V5 V6   CHIP_WELL_BARCODE        ID REPORTED_GENDER SEX AFF
# 2541 200584330083 R01C01  0  0  0 -9 200584330083_R01C01  265-1917               M   1  NA
# 2554 200584330083 R07C02  0  0  0 -9 200584330083_R07C02 262-17058               M   1  NA
# 2645 200584330132 R05C01  0  0  0 -9 200584330132_R05C01 262-13409               M   1  NA
fam_v$AFF[is.na(fam_v$AFF)] <- 0


## NA12878 in VCF sample
fam_v[grep('NA12878',fam_v$ID),]
nrow(fam_v[grep('NA12878',fam_v$ID),]) ## 35 times

nrow(fam_v) ## 3301
sum(duplicated(fam_v$ID)) ## 98
sum(!duplicated(fam_v$ID)) ## 3203
sum(duplicated(fam_v$CHIP_WELL_BARCODE)) ## 0

## why are there duplicate IDs now?
iddup <- fam_v$ID[duplicated(fam_v$ID)]
table(iddup)
fam_vdup <- subset(fam_v,fam_v$ID %in% iddup)
fam_vdup[order(fam_vdup$ID),]



## subset family file to relevant columns
fam_v2 <- fam_v[,c('SAMPLE_ID','ID','V3','V4','SEX','AFF')]

## write to file
write.table(fam_v2,'/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.fam',col=F,row=F,quo=F,sep='\t')



## quick check against autocall
tmp <- substr(fam_a$V2,start=1,stop=7)
fam_a2 <- subset(fam_a,tmp != 'NA12878')
dim(fam_a2) ## 3196

table(fam_a2$V5)
#    1    2 
# 2032 1164 

table(fam_v2$SEX)
#    1    2 
# 2085 1216 

fam_mrg <- merge(fam_a2,fam_v2,by.x='V2',by.y='ID',all=F)
dim(fam_mrg) ## 3251
## are all the sexes the same?
sum(fam_mrg$V5==fam_mrg$SEX) ## 3251
## Looks good!





## ----- VCF

## NEED to re-create pheno file first specifically for VCF
setwd('/psych/genetics_data/howrigan/projects/sc_genotyping')
fam <- read.table('GPC_COGS_CAU_VCF_filtered.fam')
write.table(fam[,c(1,2,6)],'GPC_COGS_CAU_VCF_filtered.phe',col=F,row=F,quo=F,sep='\t')


python /psych/genetics_data/PsychChip/resources/standardizePlinkBfile.py \
--out standardized.vcf \
--bed /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.bed \
--bim /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.bim \
--fam /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.fam \
--hapmap /home/unix/jigold/hapmap_ids \
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt \
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt \
--name-update /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt \
--chr-update /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt \
--pos-update /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt > GPC_COGS_CAU_Psych_VCF.FHG19.log



## VCF: tracking variants in standardizePlinkBfile.py log report

## tmp3.log
--keep /broad/hptmp/howrigan/standardized.vcf_909FH8IEVQ/nonHapMap.sample_list
595652 variants loaded from .bim file
--keep: 3266 people remaining

## tmp4.log
--update-name /broad/hptmp/howrigan/standardized.vcf_909FH8IEVQ/nameRemoveManifestPrefix.txt
595652 variants loaded from .bim file
--update-name: 0 values updated

## tmp5.log
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt
595652 variants loaded from .bim file
--exclude: 582930 variants remaining.

## tmp6.log
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt
582930 variants loaded from .bim file
--extract: 578202 variants remaining

## tmp7.log
--update-chr /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt
578202 variants loaded from .bim file
--update-chr: 578202 values updated, 18803 variant IDs not present.

## tmp8.log
--update-map /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt
578202 variants loaded from .bim file
--update-map: 578202 values updated, 18803 variant IDs not present.

## tmp9.log
--update-name /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt
578202 variants loaded from .bim file
--update-name: 1 value updated, 266 variant IDs not present.




## GAP autocall: tracking variants in standardizePlinkBfile.py log report

## tmp4.log
--keep /broad/hptmp/howrigan/standardized.vcf_909FH8IEVQ/nonHapMap.sample_list
603132 variants loaded from .bim file
--keep: 3231 people remaining

## tmp5.log
--update-name /broad/hptmp/howrigan/standardized.vcf_909FH8IEVQ/nameRemoveManifestPrefix.txt
603132 variants loaded from .bim file
--update-name: 8050 values updated

## tmp6.log
--exclude /psych/genetics_data/PsychChip/resources/pchip_blackList_dec2015_stripped.txt
603132 variants loaded from .bim file
--exclude: 590164 variants remaining.

## tmp7.log
--extract /psych/genetics_data/PsychChip/resources/PsychChip_snps_singlePerfectMatches_160216.txt
590164 variants loaded from .bim file
--extract: 583251 variants remaining

## tmp8.log
--update-chr /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt
583251 variants loaded from .bim file
--update-chr: 583251 values updated, 13754 variant IDs not present.

## tmp9.log
--update-map /psych/genetics_data/PsychChip/resources/pchip_posupdate_160219.txt
583251 variants loaded from .bim file
--update-map: 583251 values updated, 13754 variant IDs not present.

## tmp10.log
--update-name /psych/genetics_data/PsychChip/resources/PsychChip_rsid_update_160202.txt
583251 variants loaded from .bim file
--update-name: 123 value updated, 144 variant IDs not present.








## Double check some positional updates

/psych/genetics_data/howrigan/projects/sc_genotyping

# psy_rs3114658 5
# rs8091710 18
# variant.34042 14
# exm632399 7
# rs2761476 1
# rs10757953 9
# rs17116269 14
# exm1074481 13
# rs11129141 3
# exm155904 1

head /psych/genetics_data/PsychChip/resources/pchip_chrupdate_160219.txt | awk '{print$1}' > tmp
grep -f tmp GPC_COGS_CAU_VCF_filtered.bim

# 1	rs2761476	0	178625499	A	G
# 1	exm155904	0	228480317	T	C
# 3	rs11129141	0	24281656	G	T
# 5	psy_rs3114658	0	90223544	C	T
# 7	exm632399	0	88963855	A	C
# 9	rs10757953	0	30447342	A	G
# 13	exm1074481	0	95114331	A	G
# 14	rs17116269	0	46094385	T	C
# 14	variant.34042	0	105455430	C	T
# 18	rs8091710	0	74768504	T	C
# 20	exm1559048	0	62153135	T	C







## --- Checking SNPs

library(data.table)

# bim_a <- fread('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/autocall/GPC_COGS_CAU_Psych.FHG19.bim',stringsAsFactors=F)
bim_a <- fread('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge.bim',stringsAsFactors=F)
nrow(bim_a) ## 561230
pos <- paste0(bim_a$V1,'_',bim_a$V4)
bim_a$pos <- pos

bimv <- fread('/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.bim',stringsAsFactors=F)
nrow(bimv) ## 595652
pos <- paste0(bimv$V1,'_',bimv$V4)
bimv$pos <- pos


## --- Annotate:

## INDEL in autocall
type <- rep('SNP',nrow(bim_a))
type[bim_a$V5=='-'] <- 'INDEL'
type[bim_a$V6=='-'] <- 'INDEL'
table(type)
 # INDEL    SNP 
 # 11933 549297 
bim_a$type <- type

## INDEL in VCF
typev <- rep('SNP',nrow(bimv))
typev[nchar(bimv$V5) > 1] <- 'INDEL'
typev[nchar(bimv$V6) > 1] <- 'INDEL'
typev[bimv$V5=='-'] <- 'INDEL'
typev[bimv$V6=='-'] <- 'INDEL'
table(typev)
 # INDEL    SNP 
 # 11924 583728 
bimv$type <- typev


## Adjusting INDEL position in VCF
bimv$bp2 <- bimv$V4
bimv$bp2[bimv$type=='INDEL'] <- bimv$V4[bimv$type=='INDEL'] + 1
bimv$pos2 <- paste0(bimv$V1,'_',bimv$bp2)


## DUPE in autocall

## check for duplicates in rsID (V2)
sum(duplicated(bim_a$V2)) ## 0

## check for position duplicated
sum(duplicated(bim_a$pos)) ## 7654

posdup <- bim_a$pos[duplicated(bim_a$pos)]
indx <- bim_a$pos %in% posdup
dup <- rep(FALSE,nrow(bim_a))
dup[indx] <- TRUE
table(dup)
#  FALSE   TRUE 
# 577334  25798
# 2.7% 
bim_a$dup <- dup



## DUPE in VCF

## check for duplicates in rsID (V2)
sum(duplicated(bimv$V2)) ## 0

## check for position duplicated
sum(duplicated(bimv$pos)) ## 8187

posdup <- bimv$pos[duplicated(bimv$pos)]
indx <- bimv$pos %in% posdup
dup <- rep(FALSE,nrow(bimv))
dup[indx] <- TRUE
table(dup)
#  FALSE   TRUE 
# 579304  16348 
bimv$dup <- dup

table(bimv$type[bimv$dup==T])
# INDEL   SNP 
#    76 16272 

bimv_dup <- bimv[bimv$dup==T,]
## A lot of duplicated sites where the rsID is different, but the SNP is the same
table(table(bimv_dup$pos))
#    2    3 
# 8135   26 

table(bimv_dup$V1)
#    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24 
# 1553 1180  983  818  920 1436  795  697  647  761  952  828  386  495  483  550  635  336  736  396  191  194  374    2 



## check for the sites where SNP and INDEL share the same position
chk <- bimv$pos[bimv$type=='INDEL' & bimv$dup==T]
chk2 <- subset(bimv,bimv$pos %in% chk)
chk2 <- as.data.frame(chk2[order(chk2$V1,chk2$V4,chk2$type),])
table(chk2$type)
# INDEL   SNP 
#    76    73 
table(table(chk2$pos))
#  2  3 
# 73  1 

# A few unusual examples:
# 140 19 exm-IND19-49162439  0  44470599        T       TG  19_44470599 INDEL  44470600  19_44470600 TRUE
# 141 19     newrs143754177  0  44470599        T       TG  19_44470599 INDEL  44470600  19_44470600 TRUE

# 39  4       indel.82801  0 128951724        C     CG 4_128951724 INDEL 128951725 4_128951725 TRUE
# 40  4         exm424348  0 128951724        T      C 4_128951724   SNP 128951724 4_128951724 TRUE
# 41  4     variant.82802  0 128951724        T      C 4_128951724   SNP 128951724 4_128951724 TRUE


## check for position2 duplicated
sum(duplicated(bimv$pos2)) ## 8215
posdup <- bimv$pos2[duplicated(bimv$pos2)]
indx <- bimv$pos2 %in% posdup
dup <- rep(FALSE,nrow(bimv))
dup[indx] <- TRUE
table(dup)
#  FALSE   TRUE 
# 579250  16402 

table(bimv$type[dup==T])
# INDEL   SNP 
#   104 16298 

bimv[dup==T,]

## Difference is likely scenarios where SNP is next to INDEL startpoint



## ------- check OVERLAP

## 1) autocall genotypes missing from VCF
amiss <- subset(bim_a,!bim_a$pos %in% bimv$pos2)
nrow(amiss) ## 4601
table(amiss$dup)
# FALSE  TRUE 
#  4599     2 
table(amiss$type)
# INDEL   SNP 
#  1071  3530 
table(amiss$V1)
# chr26 = 206 of 422

amiss_rate <- table(amiss$V1) / table(bim_a$V1)
round(amiss_rate,3)
#     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16 
# 0.007 0.006 0.007 0.006 0.008 0.005 0.007 0.006 0.006 0.006 0.007 0.006 0.005 0.005 0.006 0.005 
#    17    18    19    20    21    22    23    24    25    26 
# 0.006 0.007 0.005 0.006 0.006 0.004 0.051 0.276 1.000 0.967 

# -- Remove chr25 & chr26 variants
table(amiss$type[amiss$V1==25 | amiss$V1==26])
# INDEL   SNP 
#     4   306 

amiss2 <- subset(amiss,amiss$V1 != 25 & amiss$V1 != 26)
table(amiss2$dup)
# FALSE 
#  4291 

table(amiss2$type)
# INDEL   SNP 
#  1067  3224 

## see if indels are spread across chromosomes
tapply(amiss2$type,amiss2$V1,function(X) {sum(X=='INDEL')})
#   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24 
# 112  91  61  47  53  57  48  39  32  36  86  85  13  40  55  36  41  31  28  24  11  14  25   2 

## see if SNPs are spread across chromosomes
tapply(amiss2$type,amiss2$V1,function(X) {sum(X=='SNP')})
#   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24 
# 227 194 182 115 171 103 156 107 105 105 119 103  64  53  58  80  87  58  73  55  31  29 622 327 

# VERDICT: same exact variants as before, so duplicate variants in VCF are not changing anything





## 1) VCF genotypes missing from autocall
vmiss <- subset(bimv,!bimv$pos2 %in% bim_a$pos)
nrow(vmiss) ## 38636
table(vmiss$dup)
# FALSE  TRUE 
# 38281   355 
table(vmiss$type)
# INDEL   SNP 
#   689  8122 

table(vmiss$V1)
 #   1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   26 
 # 993 1067  808  754  314  574  670  258  442  505  269  514  138  139  148  196  218  132  185  107   59  218   34   49   20 

vmiss_rate <- table(vmiss$V1) / table(bimv$V1)
round(vmiss_rate,3)
#     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    26 
# 0.019 0.023 0.021 0.024 0.010 0.016 0.023 0.010 0.018 0.019 0.008 0.017 0.009 0.007 0.008 0.009 0.009 0.010 0.008 0.007 0.008 0.021 0.002 0.028 0.645 


## see if indels are spread across chromosomes
tapply(vmiss$type,vmiss$V1,function(X) {sum(X=='INDEL')})
#  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 26 
# 83 75 44 44 38 37 22 28 16 19 29 30 17 25 30 12 34 12 52 17  5  9 10  1  0 

## see if SNPs are spread across chromosomes
tapply(vmiss$type,vmiss$V1,function(X) {sum(X=='SNP')})
#   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  26 
# 910 992 764 710 276 537 648 230 426 486 240 484 121 114 118 184 184 120 133  90  54 209  24  48  20 

# VERDICT: same exact variants as before (+1), so duplicate variants in VCF are not changing anything




## -- cleaning up NA12878 samples

# === Merged calls
fam_a <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge.fam',stringsAsFactors=F)
nrow(fam_a) ## 3226

tmp <- substr(fam_a$V2,start=1,stop=7)
fam_a_rem <- subset(fam_a,tmp == 'NA12878')
nrow(fam_a_rem) ## 29

fam_a2 <- subset(fam_a,tmp != 'NA12878')
sum(duplicated(fam_a2$V2)) ## 0


# === VCF calls
fam_v <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/standardized.vcf.fam',stringsAsFactors=F)
nrow(fam_v) ## 3266

## remove NA12878
tmp <- substr(fam_v$V2,start=1,stop=7)
fam_v_rem <- subset(fam_v,tmp == 'NA12878')
nrow(fam_v_rem) ## 0

fam_v2 <- subset(fam_v,fam_v$V2 != 'NA12878')

## Remaining duplicates
sum(duplicated(fam_v2$V1)) ## 0
sum(duplicated(fam_v2$V2)) ## 64

## Append duplicates 
tmp <- subset(fam_v2,duplicated(fam_v2$V2))
fam_v_rem <- rbind(fam_v_rem,tmp)
nrow(fam_v_rem) ## 99

fam_v2 <- subset(fam_v2,!fam_v2$V1 %in% tmp$V1)



## -- check overlaps of samples

chk <- fam_a2[!fam_a2$V2 %in% fam_v2$V2,] 
#          V1        V2 V3 V4 V5 V6
# 1  SM-4D3L1 11C119483  0  0  1  1
# 46 SM-4D61E MH0157001  0  0  1  1
# 47 SM-4DO22 MH0148538  0  0  1  1
fam_a_rem <- rbind(fam_a_rem,chk)


chk2 <- fam_v2[!fam_v2$V2 %in% fam_a2$V2,] 
#            V1        V2 V3 V4 V5 V6
# 594  SM-CMQ5X  09C81257  0  0  1  2
# 1017 SM-CMQO7  04C29810  0  0  2  2
# 1442 SM-CN2UY  06C56176  0  0  1  2
# 1765 SM-CN2SU  05C46932  0  0  1  2
# 2514 SM-CNH4T  265-1917  0  0  1 -9
# 2527 SM-CNH6K 262-17058  0  0  1 -9
# 2617 SM-CNH5F 262-13409  0  0  1 -9
# 2746 SM-CNH2P  06C57480  0  0  1  2
fam_v_rem <- rbind(fam_v_rem,chk2)


nrow(fam_a_rem) ## 32
nrow(fam_v_rem) ## 72

nrow(fam_a) - nrow(fam_a_rem) ## 3194
nrow(fam_v) - nrow(fam_v_rem) ## 3194


## write merged call removal list
write.table(fam_a_rem[,1:2],'/psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge.indiv.exclude',col=F,row=F,quo=F,sep='\t')

## write VCF removal list
write.table(fam_v_rem[,1:2],'/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.indiv.exclude',col=F,row=F,quo=F,sep='\t')



## ===== Filter files and put in rp directories

plink --noweb --bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge \
--remove /psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_merge.indiv.exclude \
--make-bed --out /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych
# After filtering, 2399 cases, 792 controls and 3 missing
# After filtering, 2030 males, 1164 females, and 0 of unspecified sex


plink --noweb --bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/GPC_COGS_CAU_Psych_2caller \
--keep /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych.fam \
--make-bed --out /psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp/GPC_COGS_CAU_Psych
# After filtering, 2399 cases, 792 controls and 3 missing
# After filtering, 2030 males, 1164 females, and 0 of unspecified sex


plink --noweb --bfile /psych/genetics_data/howrigan/projects/sc_genotyping/standardized.vcf \
--remove /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.indiv.exclude \
--make-bed --out /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF
# After filtering, 2399 cases, 792 controls and 3 missing
# After filtering, 2030 males, 1164 females, and 0 of unspecified sex


## quick check bim files
wc -l /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych.bim ## 583251
wc -l /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF.bim ## 578202

## quick check fam files
fam_a <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych.fam')
fam_v <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF.fam')
dim(fam_a)
dim(fam_v)

## check sex
fam_mrg <- merge(fam_a,fam_v,by='V2')
sum(fam_mrg$V5.x==fam_mrg$V5.y) ## 3194



## --- Running QC in Ricopili

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp')
mkdir gap_rp_out
cd gap_rp_out
ln -s ../GPC_COGS_CAU_Psych.fam GPC_COGS_CAU_Psych.fam
ln -s ../GPC_COGS_CAU_Psych.bim GPC_COGS_CAU_Psych.bim
ln -s ../GPC_COGS_CAU_Psych.bed GPC_COGS_CAU_Psych.bed

../rp_bin/preimp_dir_12 --dis scz --popname eur --out cau1

# .......testing necessary binaries....
# plague_2	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# rep_qc2_14	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# id_tager_2	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# my.linksub	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# txt2xls	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# blueprint	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# gwa_plot_3	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# shrinkpdf	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# plothist2	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# qqplot_5	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# lahunt_9	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# pdflatex	found in /usr/bin
# my.start_job	found in /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/rp_bin
# .......testing email program....
# !!Warning!! : No mutt command available, trying mail
# mail	found in /bin
# ....all necessary binaries found....
# ------------------------------------
# testing environment variable rp_perlpackages....
# ....all set....
# ------------------------------------
# please edit scz.names

../rp_bin/preimp_dir_12 --dis scz --popname eur --out cau1

# blueprint  --noerr --njob 1 --array plague.job_list --wa 1 --mem 2000 --j --na plague.cau1 
# starting job_array, j.plague.cau1
# blueprint --njob 1000 -b "preimp_dir_12 --dis scz --popname eur --out cau1" --wa 4 --di -j --fwt /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/j.plague.cau1.id --na _pr_cau1
# starting motherscript, depending on 6148181
# ------------------------------------------------------------
# 1 jobs successfully submitted
# please see tail of /home/unix/howrigan/rp_logs/preimp_dir_info for regular updates
# also check bjobs -w for running jobs
# possibly differnt command on different computer cluster: e.g. qstat -u USER
# you will be informed via email if errors or successes occur
# ------------------------------------------------------------
# 10:18pm howrigan@sgi1 /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out $ qstat
# job-ID     prior   name       user         state submit/start at     queue                          jclass                         slots ja-task-ID 
# ------------------------------------------------------------------------------------------------------------------------------------------------
#    6142093 0.66892 QLOGIN     howrigan     r     02/21/2017 20:47:26 interactive@sgi1.broadinstitut                                    1        
#    6148181 0.66892 plague.cau howrigan     r     02/21/2017 22:18:39 short@uger-c063.broadinstitute                                    1 1
#    6148182 0.00000 _pr_cau1   howrigan     hqw   02/21/2017 22:18:38                                                                   1        



setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp')
mkdir vcf_rp_out
cd vcf_rp_out
ln -s ../GPC_COGS_CAU_VCF.fam GPC_COGS_CAU_VCF.fam
ln -s ../GPC_COGS_CAU_VCF.bim GPC_COGS_CAU_VCF.bim
ln -s ../GPC_COGS_CAU_VCF.bed GPC_COGS_CAU_VCF.bed

../rp_bin/preimp_dir_12 --dis scz --popname eur --out cau1






setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp')
mkdir gap2_rp_out
cd gap2_rp_out
ln -s ../GPC_COGS_CAU_Psych.fam GPC_COGS_CAU_Psych.fam
ln -s ../GPC_COGS_CAU_Psych.bim GPC_COGS_CAU_Psych.bim
ln -s ../GPC_COGS_CAU_Psych.bed GPC_COGS_CAU_Psych.bed

../rp_bin/preimp_dir_12 --dis scz --popname eur --out cau1

...........waiting for results

## ---- examine differences in meta file pdf




## --- sub-sampling SNPs


## --- selecting a subsample of variants to maintain

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')


bim_a <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc.bim')
bim_v <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc.bim')

dim(bim_a) ## 450749
dim(bim_v) ## 443540

var2 <- merge(bim_a,bim_v,by='V2',all=F)
dim(var2) ## 438831

## Per-chromosome SNP count
table(bim_a$V1)
table(bim_v$V1)
round(table(bim_a$V1) / table(bim_v$V1),3)
 #     1      2      3      4      5      6      7      8      9     10     11     12     13     14 
 # 1.015  1.015  1.012  1.015  1.016  1.012  1.015  1.013  1.012  1.013  1.011  1.011  1.015  1.011 
 #    15     16     17     18     19     20     21     22     23     24     25     26 
 # 1.012  1.007  1.013  1.014  1.012  1.013  1.012  1.007  1.107  1.831  0.740 10.632 

table(bim_a$V1[bim_a$V1 > 22])
#    23    24    25    26 
# 11181   769    54   202 

table(bim_v$V1[bim_v$V1 > 22])
#    23    24    25    26 
# 10102   420    73    19 



## sample 5000 SNPs from this set
set.seed(2)
snps <- sample(var2$V2,10000,replace=F)

map3 <- subset(var2,var2$V2 %in% snps)

table(table(map3$V4.x))
#    1    2 
# 9992    4 
dups <- map3$V4.x[duplicated(map3$V4.x)]
map3[map3$V4.x %in% dups,]
#                        V2 V1.x V3.x      V4.x V5.x V6.x V1.y V3.y      V4.y V5.y V6.y
# 37132           exm133727    1    0 196927185    T    G    1    0 196927185    T    G
# 55182          exm1557825   20    0  61528271    T    C   20    0  61528271    T    C
# 57043           exm158099    1    0 230845794    G    A    1    0 230845794    G    A
# 151380          exm987599   12    0  15776164    C    A   12    0  15776164    C    A
# 159710      newrs41257904    1    0 196927185    T    G    1    0 196927185    T    G
# 274944          rs1883847   20    0  61528271    T    C   20    0  61528271    T    C
# 375298              rs699    1    0 230845794    G    A    1    0 230845794    G    A
# 435120 seq_chr12_15776164   12    0  15776164    C    A   12    0  15776164    C    A


table(map3$V1.x)
#   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25 
# 905 765 644 571 573 638 481 473 427 505 511 497 289 318 285 367 342 247 359 252 136 165 237   9   4 


## write ou SNP list
write.table(snps,'/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/subsamp.snps',col=F,row=F,quo=F,sep='\t')





## --- creating downsampled files

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc \
--extract /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/subsamp.snps \
--make-bed \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

## sub-setting PLINK VCF files
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--extract /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/subsamp.snps \
--make-bed \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF



## - retrieve summary stats from both

## - allele freq / count

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF


## check FULL list SNPs
plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_full

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_full


## - missingness
plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF


## - full missingness
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_full

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_full


## - preQC missingness
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_preQC

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_preQC

## - raw missingness
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/standardized.autocall \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_raw

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered \
--missing \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_raw





## - relatedness

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--genome \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

gzip cau1_eur_GAP.genome

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--genome \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF

gzip cau1_eur_VCF.genome


## ---- merged genome

# /home/unix/sripke/plink_src/plink_1.9_newest/plink \
# --allow-no-sex \
# --bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
# --bmerge /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
# --out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_COMB

## look at missnps
grep -f cau1_eur_COMB.missnp cau1_eur_GAP.bim | head | cc
grep -f cau1_eur_COMB.missnp cau1_eur_VCF.bim | head | cc

## subset GAP
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--exclude cau1_eur_COMB.missnp \
--make-bed \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAPtmp

## subset VCF
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--exclude cau1_eur_COMB.missnp \
--make-bed \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCFtmp

## merge
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAPtmp \
--bmerge /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCFtmp \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_COMB

## Run --genome
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_COMB \
--genome \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_COMB

gzip cau1_eur_COMB.genome




## - heterozygosity

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF

## - full heterozygosity

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_full

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_full

## 2 caller heterozygosity
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp/gap2_rp_out/qc/scz_cau1_eur_dh-qc \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP2call_full


## Autosome heterozygosity
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--autosome \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_auto

## 2 caller Autosome heterozygosity
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp/gap2_rp_out/qc/scz_cau1_eur_dh-qc \
--autosome \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP2call_auto

## GAP Autosome heterozygosity
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp/gap2_rp_out/qc/scz_cau1_eur_dh-qc \
--autosome \
--het \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_auto







## --- HWE / fisher

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP \
--hardy \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF \
--hardy \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF

## Full genome
/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc \
--hardy \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_full

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/vcf_rp_out/qc/scz_cau1_eur_dh-qc \
--hardy \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_full





## - full sex-check

/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych \
--check-sex ycount\
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_GAP_full


/home/unix/sripke/plink_src/plink_1.9_newest/plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF \
--check-sex ycount \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/cau1_eur_VCF_full







## --- graphs of results


## --- comparing allele counts between sets

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

auto <- read.table('cau1_eur_GAP.frq',h=T,stringsAsFactors=F)
auto$COUNT <- round(auto$MAF * auto$NCHROBS,0)

vcf <- read.table('cau1_eur_VCF.frq',h=T,stringsAsFactors=F)
vcf$COUNT <- round(vcf$MAF * vcf$NCHROBS,0)
sum(vcf$SNP %in% auto$SNP) ## 10000 (all of them!)

## NOTE: Y-chr is NA'ed out for VCF
auto[auto$CHR==24,]
vcf[vcf$CHR==24,]

## merge auto and vcf
maf <- merge(auto,vcf,by='SNP')
# maf <- subset(maf,!is.na(maf$MAF.y))

maf$COUNT_diff <- maf$COUNT.x - maf$COUNT.y
summary(maf$COUNT_diff)
#      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# -169.0000   -1.0000    0.0000    0.8539    2.0000  257.0000 

maf$MAF_diff <- maf$MAF.x - maf$MAF.y
summary(maf$MAF_diff)
#       Min.    1st Qu.     Median       Mean    3rd Qu.       Max. 
# -0.0268800 -0.0003000 -0.0000003 -0.0000164  0.0002000  0.0434000 

maf$NCHROBS_diff <- maf$NCHROBS.x - maf$NCHROBS.y
summary(maf$NCHROBS_diff)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -106.00    4.00    4.00    4.81    4.00  112.00 


## Look at results:

maf <- maf[order(maf$COUNT_diff),]

## X chrom looks fine now
mafx <- subset(maf,maf$CHR.x == 23)
summary(mafx$COUNT_diff)
 #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 # -41.00   -4.00    0.00   -1.16    1.00   29.00 

## get VCF - autocall differences
maf$maf_diff2 <- maf$MAF.y - maf$MAF.x
maf$cnt_diff2 <- maf$COUNT.y - maf$COUNT.x 
maf$chr_diff2 <- maf$NCHROBS.y - maf$NCHROBS.x 

maf$maf_ratio <- maf$MAF.x / maf$MAF.y
maf$maf_ratio2 <- maf$MAF.y / maf$MAF.x
maf$count_ratio2 <- maf$COUNT.y / maf$COUNT.x
maf$mean_maf <- (maf$MAF.y + maf$MAF.x) / 2



## SCATTERPLOT of MAF-diff


pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_MAFdiff.pdf')

par(mfrow=c(2,2))

## common variants MAF
maf3 <- subset(maf,maf$mean_maf >= 0.05)
plot(maf3$MAF.x,maf3$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf3),' Common SNPs (MAF >= 5%)'),xlab='GAP MAF',ylab='VCF MAF')
points(maf3$MAF.x[maf3$CHR.x==23],maf3$MAF.y[maf3$CHR.x==23],pch=16,cex=0.6,col='green')
points(maf3$MAF.x[maf3$CHR.x==24],maf3$MAF.y[maf3$CHR.x==24],pch=16,cex=0.6,col='orange')
abline(0,1,lty=2,col='red')

## uncommon variants MAF
maf3 <- subset(maf,maf$mean_maf < 0.05)
plot(maf3$MAF.x,maf3$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf3),' Uncommon SNPs (MAF < 5%)'),xlab='GAP MAF',ylab='VCF MAF')
points(maf3$MAF.x[maf3$CHR.x==23],maf3$MAF.y[maf3$CHR.x==23],pch=16,cex=0.6,col='green')
points(maf3$MAF.x[maf3$CHR.x==24],maf3$MAF.y[maf3$CHR.x==24],pch=16,cex=0.6,col='orange')
abline(0,1,lty=2,col='red')

## common variants MAF ratio
maf3 <- subset(maf,maf$mean_maf >= 0.05)
plot(maf3$mean_maf,maf3$maf_ratio2,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf3),' Common SNPs (MAF >= 5%)'),xlab='avg. MAF',ylab='VCF/GAP MAF ratio')
points(maf3$mean_maf[maf3$CHR.x==23],maf3$maf_ratio2[maf3$CHR.x==23],pch=16,cex=0.6,col='green')
points(maf3$mean_maf[maf3$CHR.x==24],maf3$maf_ratio2[maf3$CHR.x==24],pch=16,cex=0.6,col='orange')
abline(h=1,lty=2,col='red')

## uncommon variants MAF ratio
maf3 <- subset(maf,maf$mean_maf < 0.05)
plot(maf3$mean_maf,maf3$maf_ratio2,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf3),' Uncommon SNPs (MAF < 5%)'),xlab='avg. MAF',ylab='VCF/GAP MAF ratio')
points(maf3$mean_maf[maf3$CHR.x==23],maf3$maf_ratio2[maf3$CHR.x==23],pch=16,cex=0.6,col='green')
points(maf3$mean_maf[maf3$CHR.x==24],maf3$maf_ratio2[maf3$CHR.x==24],pch=16,cex=0.6,col='orange')
abline(h=1,lty=2,col='red')


dev.off()
## END of GRAPH





## select VARIANTs for follow up
maf3 <- maf[order(maf$cnt_diff2 * maf$maf_ratio2,decreasing=T),]
maf4 <- subset(maf3,maf3$maf_ratio2 < Inf)
maf5 <- maf4[order(maf4$count_ratio2 * maf4$maf_ratio2,decreasing=T),] ## all low MAF
#                 SNP CHR.x A1.x A2.x     MAF.x NCHROBS.x COUNT.x CHR.y A1.y A2.y    MAF.y NCHROBS.y
# 2448      exm485213     5    T    C 0.0003180      6290       2     5    T    C 0.027200      6286
# 14   chr16_49557629    16    T    A 0.0003180      6290       2    16    T    A 0.007795      6286
# 1645     exm2240536     4    A    G 0.0001592      6282       1     4    A    G 0.003501      6284
# 9974  variant.64928     2    T    C 0.0003180      6290       2     2    T    C 0.006841      6286
# 2842      exm697075     8    T    G 0.0001593      6278       1     8    T    G 0.003341      6286
# 3013      exm769619     9    A    G 0.0001591      6284       1     9    A    G 0.003182      6286
#      COUNT.y COUNT_diff   MAF_diff NCHROBS_diff maf_diff2 cnt_diff2 chr_diff2 maf_ratio2
# 2448     171       -169 -0.0268820            4 0.0268820       169        -4   85.53459
# 14        49        -47 -0.0074770            4 0.0074770        47        -4   24.51258
# 1645      22        -21 -0.0033418           -2 0.0033418        21         2   21.99121
# 9974      43        -41 -0.0065230            4 0.0065230        41        -4   21.51258
# 2842      21        -20 -0.0031817           -8 0.0031817        20         8   20.97301
# 3013      20        -19 -0.0030229           -2 0.0030229        19         2   20.00000
#      count_ratio2   mean_maf  maf_ratio
# 2448         85.5 0.01375900 0.01169118
# 14           24.5 0.00405650 0.04079538
# 1645         22.0 0.00183010 0.04547272
# 9974         21.5 0.00357950 0.04648443
# 2842         21.0 0.00175015 0.04768034
# 3013         20.0 0.00167055 0.05000000

maf3 <- maf[order(maf$COUNT_diff * maf$maf_ratio,decreasing=T),]
maf4 <- subset(maf3,maf3$maf_ratio2 < Inf)
maf5 <- maf4[order(maf4$maf_ratio,decreasing=T),] ## all low MAF
#             SNP CHR.x A1.x A2.x    MAF.x NCHROBS.x COUNT.x CHR.y A1.y A2.y     MAF.y NCHROBS.y
# 3362  exm951507    11    C    T 0.003076      6176      19    11    C    T 0.0001603      6240
# 1910  exm230562     2    C    A 0.002586      6188      16     2    C    A 0.0001610      6212
# 2027  exm282671     2    T    C 0.003544      6208      22     2    T    C 0.0003183      6284
# 2857  exm703351     8    G    A 0.001756      6264      11     8    G    A 0.0001615      6192
# 2    200610-312    24    C    G 0.005010      1996      10    24    C    G 0.0005020      1992
# 1086 exm1461036    19    T    C 0.003049      6232      19    19    T    C 0.0003210      6230
#      COUNT.y COUNT_diff  MAF_diff NCHROBS_diff  maf_diff2 cnt_diff2 chr_diff2 maf_ratio2
# 3362       1         18 0.0029157          -64 -0.0029157       -18        64 0.05211313
# 1910       1         15 0.0024250          -24 -0.0024250       -15        24 0.06225831
# 2027       2         20 0.0032257          -76 -0.0032257       -20        76 0.08981377
# 2857       1         10 0.0015945           72 -0.0015945       -10       -72 0.09197039
# 2          1          9 0.0045080            4 -0.0045080        -9        -4 0.10019960
# 1086       2         17 0.0027280            2 -0.0027280       -17        -2 0.10528042
#      count_ratio2   mean_maf maf_ratio
# 3362   0.05263158 0.00161815 19.189021
# 1910   0.06250000 0.00137350 16.062112
# 2027   0.09090909 0.00193115 11.134150
# 2857   0.09090909 0.00095875 10.873065
# 2      0.10000000 0.00275600  9.980080
# 1086   0.10526316 0.00168500  9.498442


## read in vull variant list
library(data.table)

auto <- fread('cau1_eur_GAP_full.frq',h=T,stringsAsFactors=F)
auto$COUNT <- round(auto$MAF * auto$NCHROBS,0)

vcf <- fread('cau1_eur_VCF_full.frq',h=T,stringsAsFactors=F)
vcf$COUNT <- round(vcf$MAF * vcf$NCHROBS,0)

full <- as.data.frame(merge(auto,vcf,by='SNP',all=F))
full2 <- full[,c(1:7,11:13)]
names(full2) <- c('SNP','CHR','A1','A2','GAP_MAF','GAP_NCHROBS','GAP_COUNT','VCF_MAF','VCF_NCHROBS','VCF_COUNT')

diff <- abs(full2$GAP_COUNT - full2$VCF_COUNT)

full2 <- full2[order(diff,decreasing=T),]

head(full2)
#                   SNP CHR A1 A2 GAP_MAF GAP_NCHROBS GAP_COUNT  VCF_MAF VCF_NCHROBS VCF_COUNT
# 175424 psy_rs72927430  11  A  G 0.18060        6228      1125 0.005886        6286        37
# 313623       rs326412   3  T  G 0.29760        6202      1846 0.186500        6280      1171
# 3805    exm-rs1737010   6  C  A 0.37530        6198      2326 0.467200        6282      2935
# 344291      rs4963649  12  A  G 0.27670        6246      1728 0.193300        6286      1215
# 165238 psy_rs12917588  15  T  C 0.07278        6252       455 0.006847        6280        43
# 92851       exm332686   3  T  C 0.16960        6166      1046 0.104600        6282       657
# 342838      rs4922081   8  A  C 0.36990        6226      2303 0.312600        6194      1936
# 355232       rs631620  12  T  C 0.29630        6182      1832 0.234300        6282      1472
# 185078     rs10132807  14  G  A 0.27400        6266      1717 0.218300        6252      1365
# 173665 psy_rs62428634   7  A  G 0.14340        6264       898 0.087660        6286       551

## write to file
write.table(full2,'MAF_culprits.txt',col=T,row=F,quo=F,sep='\t')



## SCATTERPLOT of MAF-diff

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

library(data.table)
maf <- fread('MAF_culprits.txt',stringsAsFactors=F)

## fun a fisher's exact test of the MAF difference
## get fisher p-values
pval <- NA

for (i in 1:nrow(maf)) {
	pa <- maf$GAP_COUNT[i] 
	qa <- maf$GAP_NCHROBS[i] - maf$GAP_COUNT[i] 
	pv <- maf$VCF_COUNT[i] 
	qv <- maf$VCF_NCHROBS[i] - maf$VCF_COUNT[i] 
	pval[i] <- fisher.test(matrix(c(pa,pv,qa,qv),2,2))$p
	print(i)
} ## END i LooP

maf$pval <- pval

write.table(maf,'MAF_culprits.txt',col=T,row=F,quo=F,sep='\t')


## get bonferroni corrected
bf <- 0.05 / nrow(maf)
# 1.139391e-07

sum(maf$pval < .05) / nrow(maf)
# 0.007077896
sum(maf$pval < bf) / nrow(maf)
# 0.0007383252


## Graph of full MAF differences
png('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_MAFdiff_full.png')

## MAF scatterplot
plot(maf$GAP_MAF,maf$VCF_MAF,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' QC passed SNPs'),xlab='GAP MAF',ylab='VCF MAF')
points(maf$GAP_MAF[maf$pval < 0.05],maf$VCF_MAF[maf$pval < 0.05],pch=16,cex=0.6,col='orange')
points(maf$GAP_MAF[maf$pval < bf],maf$VCF_MAF[maf$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

dev.off()
## END of GRAPH





## Graph of MAF < .01 differences
png('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_MAFdiff_full_maf01.png')

library(data.table)
maf <- fread('MAF_culprits.txt',stringsAsFactors=F)
maf2 <- subset(maf,maf$GAP_MAF < 0.01 & maf$VCF_MAF < 0.01)
bf <- 0.05 / nrow(maf)

## MAF scatterplot
plot(maf2$GAP_MAF,maf2$VCF_MAF,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' QC passed SNPs'),xlab='GAP MAF',ylab='VCF MAF')
points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

dev.off()
## END of GRAPH

sum(maf2$pval < .05) / nrow(maf2)
# 0.01706692
sum(maf2$pval < bf) / nrow(maf2)
# 0.00132808









## --- looking at imiss vs het

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

a_imiss <- read.table('cau1_eur_GAP_full.imiss',h=T,stringsAsFactors=F)
a_het <- read.table('cau1_eur_GAP_full.het',h=T,stringsAsFactors=F)
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.

v_imiss <- read.table('cau1_eur_VCF_full.imiss',h=T,stringsAsFactors=F)
v_het <- read.table('cau1_eur_VCF_full.het',h=T,stringsAsFactors=F)
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.


## Graph comparing the 2 sets

pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_indiv_HETvsMISS.pdf',height=6,width=12)

par(mfrow=c(1,2))
xlims=c(0,max(c(max(a_imiss$F_MISS),max(v_imiss$F_MISS))))
ylims=c(0,0.5)

plot(a_imiss$F_MISS,a_het$HET_RATE,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Proportion of missing genotypes',ylab='Heterozygosity rate',main='GAP sample')
abline(h=0.25,lty=2,col='red')

plot(v_imiss$F_MISS,v_het$HET_RATE,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Proportion of missing genotypes',ylab='Heterozygosity rate',main='VCF sample')
abline(h=0.25,lty=2,col='red')

dev.off()
## END of GRAPH




## --- het comparison

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

a_het <- read.table('cau1_eur_GAP_full.het',h=T,stringsAsFactors=F)
dim(a_het) ## 3145
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.

v_het <- read.table('cau1_eur_VCF_full.het',h=T,stringsAsFactors=F)
dim(v_het) ## 3143
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.


het_mrg <- merge(a_het,v_het,by='IID',all=F)
dim(het_mrg) ## 3126


## Graph comparing the 2 sets
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_HETcomparison.pdf',height=6,width=12)

par(mfrow=c(1,2))
lims=c(0,max(c(max(het_mrg$F.x),max(het_mrg$F.y))))
# lims2=c(0,max(c(max(het_mrg$HET_RATE.x),max(het_mrg$HET_RATE.y))))
lims2=c(0.15,0.3)


plot(het_mrg$F.x,het_mrg$F.y,col='navyblue',pch=16,cex=0.8,xlim=lims,ylim=lims,
	xlab='GAP',ylab='VCF',main='Het F-statistic')
abline(0,1,lty=2,col='red')

plot(het_mrg$HET_RATE.x,het_mrg$HET_RATE.y,col='navyblue',pch=16,cex=0.8,xlim=lims2,ylim=lims2,
	xlab='GAP',ylab='VCF',main='Het rate')
abline(0,1,lty=2,col='red')

dev.off()
## END of GRAPH











## --- looking at lmiss vs hwe all

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

a_lmiss <- read.table('cau1_eur_GAP.lmiss',h=T,stringsAsFactors=F)
a_hwe <- read.table('cau1_eur_GAP.hwe',h=T,stringsAsFactors=F)
a_hwe <- a_hwe[a_hwe$TEST=='ALL',]

v_lmiss <- read.table('cau1_eur_VCF.lmiss',h=T,stringsAsFactors=F)
v_hwe <- read.table('cau1_eur_VCF.hwe',h=T,stringsAsFactors=F)
v_hwe <- v_hwe[v_hwe$TEST=='ALL',]



## compare lmiss frequencies
miss2 <- merge(v_lmiss,a_lmiss,by='SNP')

## get fisher p-values
pval <- NA

for (i in 1:nrow(miss2)) {
	pa <- miss2$N_MISS.x[i] 
	qa <- miss2$N_GENO.x[i] - miss2$N_MISS.x[i] 
	pv <- miss2$N_MISS.y[i] 
	qv <- miss2$N_GENO.y[i] - miss2$N_MISS.y[i] 
	pval[i] <- fisher.test(matrix(c(pa,pv,qa,qv),2,2))$p
	print(i)
} ## END i LooP

miss2$pval <- pval

sum(miss2$pval < 0.05) / nrow(miss2) ## 0.0688
sum(miss2$pval < 0.01) / nrow(miss2) ## 0.0503
sum(miss2$pval < (0.05/10000)) / nrow(miss2) ## 0.012



## PLOT
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_lmiss.pdf')

lims <- c(0,0.025)

plot(miss2$F_MISS.x,miss2$F_MISS.y,col='navyblue',pch=16,cex=0.8,xlim=lims,ylim=lims,
	xlab='VCF SNP missing',ylab='Autocall SNP missing',main='SNP missingness')

points(miss2$F_MISS.x[miss2$pval < 0.05],miss2$F_MISS.y[miss2$pval < 0.05],pch=16,cex=0.8,col='orange')
points(miss2$F_MISS.x[miss2$pval < (0.05/10000)],miss2$F_MISS.y[miss2$pval < (0.05/10000)],pch=16,cex=0.8,col='red')

abline(0,1,lty=2,col='red')

dev.off()

## NOT AS INFORMATIVE




## compare hwe p-values
hwe2 <- merge(v_hwe,a_hwe,by='SNP')

## grab allele count
a_maf <- read.table('cau1_eur_GAP.frq',h=T,stringsAsFactors=F)
a_maf$COUNT <- round(a_maf$MAF * a_maf$NCHROBS,0)
v_maf <- read.table('cau1_eur_VCF.frq',h=T,stringsAsFactors=F)
tmp <- strsplit(v_maf$SNP,';',fixed=T)
v_maf$SNP <- sapply(tmp,'[',1)
v_maf$COUNT <- round(v_maf$MAF * v_maf$NCHROBS,0)

## Add count to hwe2
hwe2$COUNT.x <- a_maf$COUNT[match(hwe2$SNP,a_maf$SNP)]
hwe2$COUNT.y <- v_maf$COUNT[match(hwe2$SNP,v_maf$SNP)]

## get -log10 pval
hwe2$logp.x <- -log10(hwe2$P.x)
hwe2$logp.y <- -log10(hwe2$P.y)

## subset to AC > 20
hwe3 <- subset(hwe2,hwe2$COUNT.x > 20 & hwe2$COUNT.y > 20)
nrow(hwe3) ## 7227





## PLOT
source("/humgen/atgu1/fs03/wip/howrigan/QQ_distribution/qq2.R")

pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_HWE.pdf')

par(mfrow=c(2,2))

## Obs / Exp VCF
xlims <- c(0,max(hwe3$E.HET..x,na.rm=T))
ylims <- c(0,max(hwe3$O.HET..x,na.rm=T))
plot(hwe3$E.HET..x,hwe3$O.HET..x,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Expected HET',ylab='Observed HET',main='VCF')
points(hwe3$E.HET..x[hwe3$P.x < 0.05],hwe3$O.HET..x[hwe3$P.x < 0.05],pch=16,cex=0.8,col='orange')
points(hwe3$E.HET..x[hwe3$P.x < (0.05/nrow(hwe3))],hwe3$O.HET..x[hwe3$P.x < (0.05/nrow(hwe3))],pch=16,cex=0.8,col='red')
points(hwe3$E.HET..x[hwe3$CHR.x == 23],hwe3$O.HET..x[hwe3$CHR.x == 23],pch=16,cex=0.8,col='green')


## Obs / Exp Autocall
xlims <- c(0,max(hwe3$E.HET..y,na.rm=T))
ylims <- c(0,max(hwe3$O.HET..y,na.rm=T))
plot(hwe3$E.HET..y,hwe3$O.HET..y,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Expected HET',ylab='Observed HET',main='GAP')
points(hwe3$E.HET..y[hwe3$P.y < 0.05],hwe3$O.HET..y[hwe3$P.y < 0.05],pch=16,cex=0.8,col='orange')
points(hwe3$E.HET..y[hwe3$P.y < (0.05/nrow(hwe3))],hwe3$O.HET..y[hwe3$P.y < (0.05/nrow(hwe3))],pch=16,cex=0.8,col='red')
points(hwe3$E.HET..y[hwe3$CHR.y == 23],hwe3$O.HET..y[hwe3$CHR.y == 23],pch=16,cex=0.8,col='green')

## p-value distributions
lpx <- hwe3$P.x
lpx[lpx < 1e-9] <- 1e-9

lpy <- hwe3$P.y
lpy[lpy < 1e-9] <- 1e-9

## VCF
qq(lpx,main='VCF')

## Autocall
qq(lpy,main='GAP')

dev.off()
## END of GRAPH

## sort by VCF obs - exp
hwe4 <- hwe3[order(hwe3$E.HET..x - hwe3$O.HET..x,decreasing=T),]
# hwe4 <- subset(hwe3,hwe3$CHR.x != 23)

## check similar rates
sum(hwe4$P.x < 0.05) / nrow(hwe4) ##  0.076
sum(hwe4$P.y < 0.05) / nrow(hwe4) ## 0.067




## --- look at sex check

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')
gap <- read.table('cau1_eur_GAP_full.sexcheck',h=T)
vcf <- read.table('cau1_eur_VCF_full.sexcheck',h=T)

## PLOT
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_SexCheck.pdf',width=12,height=6)

par(mfrow=c(1,2))

xlims=c(0,1)
ylims=c(0,max(c(gap$YCOUNT,vcf$YCOUNT)))

plot(gap$F,gap$YCOUNT,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='F statistic',ylab='Y count',main='GAP')
points(gap$F[gap$PEDSEX==2],gap$YCOUNT[gap$PEDSEX==2],col='red',pch=16,cex=0.8)
abline(v=0.2,lty=2)
abline(v=0.8,lty=2)

plot(vcf$F,vcf$YCOUNT,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='F statistic',ylab='Y count',main='VCF')
points(vcf$F[vcf$PEDSEX==2],vcf$YCOUNT[vcf$PEDSEX==2],col='red',pch=16,cex=0.8)
abline(v=0.2,lty=2)
abline(v=0.8,lty=2)

dev.off()




gap <- read.table('cau1_eur_GAP_fullQC.sexcheck',h=T)
vcf <- read.table('cau1_eur_VCF_fullQC.sexcheck',h=T)

gap2 <- read.table('cau1_eur_GAP_full.sexcheck',h=T)
vcf2 <- read.table('cau1_eur_VCF_full.sexcheck',h=T)

## PLOT
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_SexCheck_PostQC.pdf',height=6,width=12)

par(mfrow=c(1,2))

xlims <- c(0,1)
ylims <- c(0,max(c(gap2$YCOUNT,vcf2$YCOUNT)))

plot(gap$F,gap$YCOUNT,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='F',ylab='Y COUNT',main='GAP')
points(gap$F[gap$PEDSEX==2],gap$YCOUNT[gap$PEDSEX==2],col='red',pch=16,cex=0.8)
abline(v=0.2,lty=2)
abline(v=0.8,lty=2)

plot(vcf$F,vcf$YCOUNT,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='F',ylab='Y COUNT',main='VCF')
points(vcf$F[vcf$PEDSEX==2],vcf$YCOUNT[vcf$PEDSEX==2],col='red',pch=16,cex=0.8)
abline(v=0.2,lty=2)
abline(v=0.8,lty=2)

dev.off()






## ===== sex chromosome differences


grep NA12878 gap_preQC/standardized.autocall.fam | awk -v OFS='\t' '{print$1, $2}' > tmp
cat GPC_COGS_CAU_VCF_filtered.indiv.exclude tmp >> tmp2

awk '{print $2}' gap_rp/gap_rp_out/qc/scz_cau1_eur_dh-qc.bim > tmp.bim

## getting Autocall MAF
plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap_preQC/standardized.autocall \
--remove /psych/genetics_data/howrigan/projects/sc_genotyping/tmp2 \
--extract /psych/genetics_data/howrigan/projects/sc_genotyping/tmp.bim \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/autocall_eur_GAP


## Graph of MAF < .01 differences
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_Autocall_VCF_MAFdiff_SexChrom.pdf')

par(mfrow=c(2,2))

library(data.table)

## GAP & VCF
gap <- fread('autocall_eur_GAP.frq',stringsAsFactors=F)
vcf <- fread('cau1_eur_VCF_full.frq',stringsAsFactors=F)
gap2 <- subset(gap,gap$CHR==23 | gap$CHR==24)
vcf2 <- subset(vcf,vcf$CHR==23 | vcf$CHR==24)
maf <- merge(gap2,vcf2,by='SNP',all=T)
## switch NAs to zero
maf$MAF.y[is.na(maf$MAF.y)] <- 0
maf$MAF.x[is.na(maf$MAF.x)] <- 0

## get chr coverage
maf$CHR.x[is.na(maf$CHR.x)] <- maf$CHR.y[is.na(maf$CHR.x)]
maf$CHR.y[is.na(maf$CHR.y)] <- maf$CHR.x[is.na(maf$CHR.y)]


## MAF scatterplot
plot(maf$MAF.x,maf$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' sex chrom QC passed SNPs'),xlab='Autocall MAF',ylab='VCF MAF')
points(maf$MAF.x[maf$CHR.x==24],maf$MAF.y[maf$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot MAF < .01
maf2 <- subset(maf,maf$MAF.x < 0.01 & maf$MAF.y < 0.01)
plot(maf2$MAF.x,maf2$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom MAF < .01'),xlab='Autocall MAF',ylab='VCF MAF')
points(maf2$MAF.x[maf2$CHR.x==24],maf2$MAF.y[maf2$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')


maf <- merge(gap2,vcf2,by='SNP',all=F)
## switch NAs to zero
maf$MAF.y[is.na(maf$MAF.y)] <- 0
maf$MAF.x[is.na(maf$MAF.x)] <- 0


## MAF scatterplot
plot(maf$MAF.x,maf$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' sex chrom overlapping SNPs'),xlab='Autocall MAF',ylab='VCF MAF')
points(maf$MAF.x[maf$CHR.x==24],maf$MAF.y[maf$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot MAF < .01
maf2 <- subset(maf,maf$MAF.x < 0.01 & maf$MAF.y < 0.01)
plot(maf2$MAF.x,maf2$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom overlapping MAF < .01'),xlab='Autocall MAF',ylab='VCF MAF')
points(maf2$MAF.x[maf2$CHR.x==24],maf2$MAF.y[maf2$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')


dev.off()




## 2-caller version (Birdseed removed)

## getting Autocall+Zcall MAF
plink \
--noweb \
--allow-no-sex \
--bfile /psych/genetics_data/howrigan/projects/sc_genotyping/gap2_rp/GPC_COGS_CAU_Psych \
--remove /psych/genetics_data/howrigan/projects/sc_genotyping/tmp2 \
--extract /psych/genetics_data/howrigan/projects/sc_genotyping/tmp.bim \
--freq \
--out /psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2/2caller_eur_GAP


## Graph of MAF differences
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_2caller_VCF_MAFdiff_SexChrom.pdf')

par(mfrow=c(2,2))

library(data.table)

## GAP & VCF
gap <- fread('2caller_eur_GAP.frq',stringsAsFactors=F)
vcf <- fread('cau1_eur_VCF_full.frq',stringsAsFactors=F)
gap2 <- subset(gap,gap$CHR==23 | gap$CHR==24)
vcf2 <- subset(vcf,vcf$CHR==23 | vcf$CHR==24)
maf <- merge(gap2,vcf2,by='SNP',all=T)
## switch NAs to zero
maf$MAF.y[is.na(maf$MAF.y)] <- 0
maf$MAF.x[is.na(maf$MAF.x)] <- 0

## get chr coverage
maf$CHR.x[is.na(maf$CHR.x)] <- maf$CHR.y[is.na(maf$CHR.x)]
maf$CHR.y[is.na(maf$CHR.y)] <- maf$CHR.x[is.na(maf$CHR.y)]


## MAF scatterplot
plot(maf$MAF.x,maf$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' sex chrom QC passed SNPs'),xlab='Autocall+Zcall MAF',ylab='VCF MAF')
points(maf$MAF.x[maf$CHR.x==24],maf$MAF.y[maf$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot MAF < .01
maf2 <- subset(maf,maf$MAF.x < 0.01 & maf$MAF.y < 0.01)
plot(maf2$MAF.x,maf2$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom MAF < .01'),xlab='Autocall+Zcall MAF',ylab='VCF MAF')
points(maf2$MAF.x[maf2$CHR.x==24],maf2$MAF.y[maf2$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')


maf <- merge(gap2,vcf2,by='SNP',all=F)
## switch NAs to zero
maf$MAF.y[is.na(maf$MAF.y)] <- 0
maf$MAF.x[is.na(maf$MAF.x)] <- 0


## MAF scatterplot
plot(maf$MAF.x,maf$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' sex chrom overlapping SNPs'),xlab='Autocall+Zcall MAF',ylab='VCF MAF')
points(maf$MAF.x[maf$CHR.x==24],maf$MAF.y[maf$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot MAF < .01
maf2 <- subset(maf,maf$MAF.x < 0.01 & maf$MAF.y < 0.01)
plot(maf2$MAF.x,maf2$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom overlapping MAF < .01'),xlab='Autocall+Zcall MAF',ylab='VCF MAF')
points(maf2$MAF.x[maf2$CHR.x==24],maf2$MAF.y[maf2$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')


dev.off()










## GAP/VCF: sex chromosome MAF

pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_MAFdiff_SexChrom.pdf')

par(mfrow=c(2,2))

library(data.table)

## GAP & VCF
gap <- fread('cau1_eur_GAP_full.frq',stringsAsFactors=F)
vcf <- fread('cau1_eur_VCF_full.frq',stringsAsFactors=F)
gap2 <- subset(gap,gap$CHR==23 | gap$CHR==24)
vcf2 <- subset(vcf,vcf$CHR==23 | vcf$CHR==24)
maf <- merge(gap2,vcf2,by='SNP',all=T)
## switch NAs to zero
maf$MAF.y[is.na(maf$MAF.y)] <- 0
maf$MAF.x[is.na(maf$MAF.x)] <- 0

## get chr coverage
maf$CHR.x[is.na(maf$CHR.x)] <- maf$CHR.y[is.na(maf$CHR.x)]
maf$CHR.y[is.na(maf$CHR.y)] <- maf$CHR.x[is.na(maf$CHR.y)]

## MAF scatterplot
plot(maf$MAF.x,maf$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf),' sex chrom QC passed SNPs'),xlab='GAP MAF',ylab='VCF MAF')
points(maf$MAF.x[maf$CHR.x==24],maf$MAF.y[maf$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot MAF < .01
maf2 <- subset(maf,maf$MAF.x < 0.01 & maf$MAF.y < 0.01)
plot(maf2$MAF.x,maf2$MAF.y,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom MAF < .01'),xlab='GAP MAF',ylab='VCF MAF')
points(maf2$MAF.x[maf2$CHR.x==24],maf2$MAF.y[maf2$CHR.y==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')


## only overlapping SNPs
maf <- fread('MAF_culprits.txt',stringsAsFactors=F)
maf2 <- subset(maf,maf$CHR==23 | maf$CHR==24)
bf <- 0.05 / nrow(maf)

## MAF scatterplot
plot(maf2$GAP_MAF,maf2$VCF_MAF,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf2),' sex chrom overlapping SNPs'),xlab='GAP MAF',ylab='VCF MAF')
points(maf2$GAP_MAF[maf2$CHR==24],maf2$VCF_MAF[maf2$CHR==24],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < 0.05],maf2$VCF_MAF[maf2$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf2$GAP_MAF[maf2$pval < bf],maf2$VCF_MAF[maf2$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

## MAF scatterplot
maf3 <- subset(maf2,maf2$GAP_MAF < 0.01 & maf2$VCF_MAF < 0.01)
plot(maf3$GAP_MAF,maf3$VCF_MAF,col='navyblue',pch=16,cex=0.8,
	main=paste0(nrow(maf3),' sex chrom overlapping MAF < .01'),xlab='GAP MAF',ylab='VCF MAF')
points(maf3$GAP_MAF[maf3$CHR==24],maf3$VCF_MAF[maf3$CHR==24],pch=16,cex=0.6,col='orange')
# points(maf3$GAP_MAF[maf3$pval < 0.05],maf3$VCF_MAF[maf3$pval < 0.05],pch=16,cex=0.6,col='orange')
# points(maf3$GAP_MAF[maf3$pval < bf],maf3$VCF_MAF[maf3$pval < bf],pch=16,cex=0.6,col='red')
abline(0,1,lty=2,col='red')

dev.off()
## END of GRAPH

sum(maf2$pval < .05) / nrow(maf2)
# 0.01706692
sum(maf2$pval < bf) / nrow(maf2)
# 0.00132808






## 3 - genotype discrepancies

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping')

hi <- c('200598720180_R12C02','200584330131_R07C01',
	'200496200038_R11C01','200584330056_R08C02',
	'200584330040_R03C02','200598830108_R01C01',
	'200584330113_R05C01','200584330068_R12C02',
	'200584330131_R12C01','200598830108_R11C02')

low <- c('200598830150_R10C01','200598830150_R09C01',
'200598830088_R12C01','200598830037_R09C02',
'200598830037_R08C01','200598720180_R03C02',
'200598160055_R08C01','200584330115_R07C02',
'200584330056_R02C01','200584330034_R02C01')

cwb <- c(hi,low)
geno_concordance <- c(rep('high',10),rep('low',10))
samps <- cbind.data.frame(cwb,geno_concordance)


id <- read.csv('BestEverCallSet.csv',stringsAsFactors=F)
nrow(id) ## 3301

fam_v <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/GPC_COGS_CAU_VCF_filtered.fam.original',stringsAsFactors=F)

indx <- match(samps$cwb,id$CHIP_WELL_BARCODE)
indx
samps$FID <- id$SAMPLE_ID[indx]
samps$IID <- id$COLLABORATOR_PARTICIPANT_ID[indx]

## reverse
samps2 <- samps[,c(3:4,1:2)]

write.table(samps2,'/psych/genetics_data/howrigan/projects/sc_genotyping/extreme_samples.txt',col=T,row=F,quo=F,sep='\t')



## get imiss numbers from both GAP and VCF

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping')


## ============= these .imiss files are from Ricopili QC ==============

a_imiss <- read.table('subsamp2/cau1_eur_GAP_full.imiss',h=T,stringsAsFactors=F)
dim(a_imiss)
v_imiss <- read.table('subsamp2/cau1_eur_VCF_full.imiss',h=T,stringsAsFactors=F)
samp <- read.table('extreme_samples.txt',h=T)

miss <- merge(a_imiss,v_imiss,by='IID',all=F)
## get variables
miss$GENO_DIFF <- miss$F_MISS.x - miss$F_MISS.y
miss$GENO_ABS_DIFF <- abs(miss$GENO_DIFF)
miss <- miss[order(miss$GENO_DIFF),]
miss$GENO_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)
miss <- miss[order(miss$GENO_ABS_DIFF),]
miss$GENO_ABS_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)

## check comparisons
t.test(miss$F_MISS.x,miss$F_MISS.y)
# t = -2.7869, df = 4637.7, p-value = 0.005343
#    mean of x    mean of y 
# 0.0005086908 0.0006144324 


## Apply to extreme samples

## miss$F_MISS.x = GAP
## miss$F_MISS.y = VCF

indx <- match(samp$IID,miss$IID)
samp$F_MISS_GAP <- miss$F_MISS.x[indx]
samp$F_MISS_VCF <- miss$F_MISS.y[indx]
samp$GENO_DIFF <- miss$GENO_DIFF[indx]
samp$GENO_DIFF_PCT <- miss$GENO_DIFF_PCT[indx]
samp$GENO_ABS_DIFF <- miss$GENO_ABS_DIFF[indx]
samp$GENO_ABS_DIFF_PCT <- miss$GENO_ABS_DIFF_PCT[indx]

samp
#         FID       IID                 cwb geno_concordance F_MISS_GAP F_MISS_VCF   GENO_DIFF GENO_DIFF_PCT GENO_ABS_DIFF GENO_ABS_DIFF_PCT
# 1  SM-CNGXT  08C72756 200598720180_R12C02             high  1.525e-03  0.0008463  0.00067870    0.92802303    0.00067870        0.92802303
# 2  SM-CN98P  04C27691 200584330131_R07C01             high  8.711e-04  0.0000835  0.00078760    0.93761996    0.00078760        0.93761996
# 3  SM-CMQAO  08C73198 200496200038_R11C01             high  9.429e-04  0.0002390  0.00070390    0.93122201    0.00070390        0.93122201
# 4  SM-CN918  00C02500 200584330056_R08C02             high  1.289e-03  0.0007786  0.00051040    0.91426743    0.00051040        0.91426743
# 5  SM-CN2QR  06C56308 200584330040_R03C02             high  1.655e-03  0.0004374  0.00121760    0.96001280    0.00121760        0.96001280
# 6  SM-CMQ3B  05C51445 200598830108_R01C01             high  2.006e-03  0.0009154  0.00109060    0.95329495    0.00109060        0.95329495
# 7  SM-CN98J  06C56234 200584330113_R05C01             high  3.289e-03  0.0001647  0.00312430    0.99520154    0.00312430        0.99520154
# 8  SM-CN2GO  06C58743 200584330068_R12C02             high  5.136e-03  0.0019800  0.00315600    0.99616123    0.00315600        0.99616123
# 9  SM-CN98Q  06C57697 200584330131_R12C01             high  1.686e-04  0.0017900 -0.00162140    0.01183621    0.00162140        0.01183621
# 10 SM-CMQ3P  06C58055 200598830108_R11C02             high  1.109e-04  0.0002458 -0.00013490    0.27767115    0.00013490        0.27767115
# 11 SM-CMQLA  04C27289 200598830150_R10C01              low  1.730e-04  0.0003427 -0.00016970    0.19929623    0.00016970        0.19929623
# 12 SM-CMQLX  05C41487 200598830150_R09C01              low  1.353e-04  0.0003292 -0.00019390    0.15802943    0.00019390        0.15802943
# 13 SM-CMQJ5  03C23527 200598830088_R12C01              low  1.841e-04  0.0004171 -0.00023300    0.11196417    0.00023300        0.11196417
# 14 SM-CMQQD  04C25458 200598830037_R09C02              low  1.109e-04  0.0002074 -0.00009650    0.37811900    0.00009650        0.37811900
# 15 SM-CMQQO  08C72666 200598830037_R08C01              low  7.543e-05  0.0002255 -0.00015007    0.23960333    0.00015007        0.23960333
# 16 SM-CNGX4 10C110060 200598720180_R03C02              low  1.021e-04  0.0001849 -0.00008280    0.41682662    0.00008280        0.41682662
# 17 SM-CNGQC  05C44589 200598160055_R08C01              low  1.109e-04  0.0002638 -0.00015290    0.23448496    0.00015290        0.23448496
# 18 SM-CN2DT  06C58374 200584330115_R07C02              low  2.596e-04  0.0005208 -0.00026120    0.08861164    0.00026120        0.08861164
# 19 SM-CN91I  05C46666 200584330056_R02C01              low  3.622e-04  0.0009027 -0.00054050    0.01791427    0.00054050        0.01791427
# 20 SM-CN2ZH  08C72647 200584330034_R02C01              low  9.983e-05  0.0002277 -0.00012787    0.29526552    0.00012787        0.29526552




## ============= these .imiss files are from matched pre QC ==============

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

a_imiss <- read.table('cau1_eur_GAP_preQC.imiss',h=T,stringsAsFactors=F)
dim(a_imiss)
v_imiss <- read.table('cau1_eur_VCF_preQC.imiss',h=T,stringsAsFactors=F)
dim(v_imiss)
samp <- read.table('../extreme_samples.txt',h=T)

miss <- merge(a_imiss,v_imiss,by='IID',all=F)
## get variables
miss$GENO_DIFF <- miss$F_MISS.x - miss$F_MISS.y
miss$GENO_ABS_DIFF <- abs(miss$GENO_DIFF)
miss <- miss[order(miss$GENO_DIFF),]
miss$GENO_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)
miss <- miss[order(miss$GENO_ABS_DIFF),]
miss$GENO_ABS_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)

miss2 <- miss[,c('IID','N_MISS.x','N_GENO.x','F_MISS.x','N_MISS.y','N_GENO.y','F_MISS.y','GENO_DIFF','GENO_ABS_DIFF','GENO_DIFF_PCT','GENO_ABS_DIFF_PCT')]
names(miss2) <- c('IID','N_MISS_GAP','N_GENO_GAP','F_MISS_GAP','N_MISS_VCF','N_GENO_VCF','F_MISS_VCF','GENO_DIFF','GENO_ABS_DIFF','GENO_DIFF_PCT','GENO_ABS_DIFF_PCT')

write.table(miss2,'cau1_eur_COMB.matchID.imiss.txt',col=T,row=F,quo=F,sep='\t')

## check comparisons
t.test(miss$F_MISS.x,miss$F_MISS.y)
# t = -0.093109, df = 4879.6, p-value = 0.9258
#   mean of x   mean of y 
# 0.001683257 0.001687736 


## Apply to extreme samples

## miss$F_MISS.x = GAP
## miss$F_MISS.y = VCF

indx <- match(samp$IID,miss$IID)
samp$F_MISS_GAP <- miss$F_MISS.x[indx]
samp$F_MISS_VCF <- miss$F_MISS.y[indx]
samp$GENO_DIFF <- miss$GENO_DIFF[indx]
samp$GENO_DIFF_PCT <- miss$GENO_DIFF_PCT[indx]
samp$GENO_ABS_DIFF <- miss$GENO_ABS_DIFF[indx]
samp$GENO_ABS_DIFF_PCT <- miss$GENO_ABS_DIFF_PCT[indx]

samp
#         FID       IID                 cwb geno_concordance F_MISS_GAP F_MISS_VCF  GENO_DIFF GENO_DIFF_PCT GENO_ABS_DIFF GENO_ABS_DIFF_PCT
# 1  SM-CNGXT  08C72756 200598720180_R12C02             high  0.0026470  0.0020440  0.0006030    0.89104571     0.0006030        0.85253601
# 2  SM-CN98P  04C27691 200584330131_R07C01             high  0.0020300  0.0008357  0.0011943    0.96430808     0.0011943        0.94614903
# 3  SM-CMQAO  08C73198 200496200038_R11C01             high  0.0021640  0.0012260  0.0009380    0.94395742     0.0009380        0.92235441
# 4  SM-CN918  00C02500 200584330056_R08C02             high  0.0020620  0.0021410 -0.0000790    0.15591735     0.0000790        0.17000626
# 5  SM-CN2QR  06C56308 200584330040_R03C02             high  0.0026660  0.0013940  0.0012720    0.96900438     0.0012720        0.95084534
# 6  SM-CMQ3B  05C51445 200598830108_R01C01             high  0.0035280  0.0024960  0.0010320    0.95209768     0.0010320        0.93331246
# 7  SM-CN98J  06C56234 200584330113_R05C01             high  0.0040370  0.0011230  0.0029140    0.99624296     0.0029140        0.97996243
# 8  SM-CN2GO  06C58743 200584330068_R12C02             high  0.0059530  0.0038980  0.0020550    0.98653726     0.0020550        0.96963056
# 9  SM-CN98Q  06C57697 200584330131_R12C01             high  0.0010050  0.0037530 -0.0027480    0.01659361     0.0027480        0.97839699
# 10 SM-CMQ3P  06C58055 200598830108_R11C02             high  0.0009876  0.0014550 -0.0004674    0.05165936     0.0004674        0.75391359
# 11 SM-CMQLA  04C27289 200598830150_R10C01              low  0.0014420  0.0010410  0.0004010    0.72917971     0.0004010        0.67063244
# 12 SM-CMQLX  05C41487 200598830150_R09C01              low  0.0014300  0.0010290  0.0004010    0.73043206     0.0004010        0.67188478
# 13 SM-CMQJ5  03C23527 200598830088_R12C01              low  0.0016270  0.0013390  0.0002880    0.58703820     0.0002880        0.51033187
# 14 SM-CMQQD  04C25458 200598830037_R09C02              low  0.0011040  0.0009858  0.0001182    0.38321853     0.0001182        0.24608641
# 15 SM-CMQQO  08C72666 200598830037_R08C01              low  0.0010960  0.0010070  0.0000890    0.33907326     0.0000890        0.18973075
# 16 SM-CNGX4 10C110060 200598720180_R03C02              low  0.0014950  0.0009599  0.0005351    0.85973701     0.0005351        0.81496556
# 17 SM-CNGQC  05C44589 200598160055_R08C01              low  0.0014560  0.0010500  0.0004060    0.73951158     0.0004060        0.68127740
# 18 SM-CN2DT  06C58374 200584330115_R07C02              low  0.0013170  0.0012940  0.0000230    0.24827802     0.0000230        0.04946775
# 19 SM-CN91I  05C46666 200584330056_R02C01              low  0.0013420  0.0023280 -0.0009860    0.02035066     0.0009860        0.92767689
# 20 SM-CN2ZH  08C72647 200584330034_R02C01              low  0.0011900  0.0012730 -0.0000830    0.15403882     0.0000830        0.17752035




## ============= these .imiss files are from raw autocall ==============

a_imiss <- read.table('subsamp2/cau1_eur_GAP_raw.imiss',h=T,stringsAsFactors=F)
dim(a_imiss)
v_imiss <- read.table('subsamp2/cau1_eur_VCF_raw.imiss',h=T,stringsAsFactors=F)
dim(v_imiss)
samp <- read.table('extreme_samples.txt',h=T)

miss <- merge(a_imiss,v_imiss,by='IID',all=F)
## get variables
miss$GENO_DIFF <- miss$F_MISS.x - miss$F_MISS.y
miss$GENO_ABS_DIFF <- abs(miss$GENO_DIFF)
miss <- miss[order(miss$GENO_DIFF),]
miss$GENO_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)
miss <- miss[order(miss$GENO_ABS_DIFF),]
miss$GENO_ABS_DIFF_PCT <- seq(1,nrow(miss),1) / nrow(miss)

## check comparisons
# t.test(miss$F_MISS.x,miss$F_MISS.y)
# t = 2.7657, df = 4059.8, p-value = 0.005705
#   mean of x   mean of y 
# 0.004608588 0.004198527 


## Apply to extreme samples

## miss$F_MISS.x = GAP
## miss$F_MISS.y = VCF

indx <- match(samp$IID,miss$IID)
samp$F_MISS_GAP <- miss$F_MISS.x[indx]
samp$F_MISS_VCF <- miss$F_MISS.y[indx]
samp$GENO_DIFF <- miss$GENO_DIFF[indx]
samp$GENO_DIFF_PCT <- miss$GENO_DIFF_PCT[indx]
samp$GENO_ABS_DIFF <- miss$GENO_ABS_DIFF[indx]
samp$GENO_ABS_DIFF_PCT <- miss$GENO_ABS_DIFF_PCT[indx]

samp
#         FID       IID                 cwb geno_concordance F_MISS_GAP F_MISS_VCF GENO_DIFF GENO_DIFF_PCT GENO_ABS_DIFF GENO_ABS_DIFF_PCT
# 1  SM-CNGXT  08C72756 200598720180_R12C02             high   0.006268   0.005137  0.001131    0.78302176      0.001131         0.5942384
# 2  SM-CN98P  04C27691 200584330131_R07C01             high   0.005798   0.003039  0.002759    0.90131781      0.002759         0.8844622
# 3  SM-CMQAO  08C73198 200496200038_R11C01             high   0.006301   0.003698  0.002603    0.89610788      0.002603         0.8789458
# 4  SM-CN918  00C02500 200584330056_R08C02             high   0.006674   0.004258  0.002416    0.88752682      0.002416         0.8700582
# 5  SM-CN2QR  06C56308 200584330040_R03C02             high   0.011420   0.003875  0.007545    0.98038615      0.007545         0.9653693
# 6  SM-CMQ3B  05C51445 200598830108_R01C01             high   0.012120   0.005864  0.006256    0.97088569      0.006256         0.9552559
# 7  SM-CN98J  06C56234 200584330113_R05C01             high   0.014900   0.003652  0.011248    0.99111247      0.011248         0.9770150
# 8  SM-CN2GO  06C58743 200584330068_R12C02             high   0.014860   0.007961  0.006899    0.97793442      0.006899         0.9623046
# 9  SM-CN98Q  06C57697 200584330131_R12C01             high   0.001996   0.003101 -0.001105    0.20318725      0.001105         0.5767698
# 10 SM-CMQ3P  06C58055 200598830108_R11C02             high   0.001836   0.003344 -0.001508    0.02359792      0.001508         0.7989580
# 11 SM-CMQLA  04C27289 200598830150_R10C01              low   0.001670   0.003203 -0.001533    0.02114618      0.001533         0.8032485
# 12 SM-CMQLX  05C41487 200598830150_R09C01              low   0.001766   0.003168 -0.001402    0.04872816      0.001402         0.7667790
# 13 SM-CMQJ5  03C23527 200598830088_R12C01              low   0.002513   0.003816 -0.001303    0.09071407      0.001303         0.7128409
# 14 SM-CMQQD  04C25458 200598830037_R09C02              low   0.001852   0.003220 -0.001368    0.06251915      0.001368         0.7490040
# 15 SM-CMQQO  08C72666 200598830037_R08C01              low   0.001740   0.003213 -0.001473    0.02911431      0.001473         0.7916028
# 16 SM-CNGX4 10C110060 200598720180_R03C02              low   0.001783   0.003235 -0.001452    0.03493717      0.001452         0.7842476
# 17 SM-CNGQC  05C44589 200598160055_R08C01              low   0.001696   0.003275 -0.001579    0.01869445      0.001579         0.8084585
# 18 SM-CN2DT  06C58374 200584330115_R07C02              low   0.002477   0.003492 -0.001015    0.25068955      0.001015         0.5203800
# 19 SM-CN91I  05C46666 200584330056_R02C01              low   0.003748   0.004671 -0.000923    0.29574012      0.000923         0.4646031
# 20 SM-CN2ZH  08C72647 200584330034_R02C01              low   0.002586   0.003709 -0.001123    0.19307386      0.001123         0.5887220





## merge together
## see if it matches

## find discordant genotypes
## check avg. MAF differences here (like GSA)





gfam <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/gap_rp/GPC_COGS_CAU_Psych.fam')
vfam <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/vcf_rp/GPC_COGS_CAU_VCF.fam')

sum(gfam$V2 %in% vfam$V2) ## 3194
sum(gfam$V1 %in% vfam$V1) ## 0

# pheno_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/phenofile/GPC_COGS_CAU_Psych.fam.pheno.txt',h=T,sep='\t')
pheno_a <- read.table('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_w2_2017/phenofile/GPC_COGS_CAU_Psych.fam.pheno.txt',h=T,sep='\t')
pheno_v <- read.csv('/psych/genetics_data/howrigan/projects/sc_genotyping/BestEverCallSet.csv',stringsAsFactors=F)




## --- Relatedness comparison: reading in combined genome file

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

library(data.table)
gen <- fread('zcat cau1_eur_COMB.genome.gz',stringsAsFactors=F)

## identical IID
gen2 <- subset(gen,gen$IID1==gen$IID2)

dim(gen2) ## 3126
summary(gen2$PI_HAT)
 #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 # 0.9256  0.9957  0.9957  0.9972  1.0000  1.0000 

gen2 <- gen2[order(gen2$PI_HAT),]

id <- read.csv('/psych/genetics_data/howrigan/projects/sc_genotyping/BestEverCallSet.csv',stringsAsFactors=F)
indx <- match(gen2$IID1,id$COLLABORATOR_PARTICIPANT_ID)
gen2$CHIP_WELL_BARCODE <- id$CHIP_WELL_BARCODE[indx]

gen3 <- as.data.frame(gen2)
gen3 <- gen3[,c('IID1','CHIP_WELL_BARCODE','PI_HAT')]
gen3$pct <- seq(1,nrow(gen3),1)/nrow(gen3)

write.table(gen3,'cau1_eur_COMB.matchID.genome.txt',col=T,row=F,quo=F,sep='\t')


samp <- read.table('/psych/genetics_data/howrigan/projects/sc_genotyping/extreme_samples.txt',h=T)

## match these samples to genome
samp2 <- merge(samp,gen3,by.x='IID',by.y='IID1',all=F)

samp2[order(samp2$geno_concordance),]
#          IID      FID                 cwb geno_concordance   CHIP_WELL_BARCODE PI_HAT        pct
# 1   00C02500 SM-CN918 200584330056_R08C02             high 200584330056_R08C02 0.9957 0.26967370
# 5   04C27691 SM-CN98P 200584330131_R07C01             high 200584330131_R07C01 0.9957 0.10748560
# 9   05C51445 SM-CMQ3B 200598830108_R01C01             high 200598830108_R01C01 0.9957 0.34836852
# 10  06C56234 SM-CN98J 200584330113_R05C01             high 200584330113_R05C01 0.9930 0.01823417
# 11  06C56308 SM-CN2QR 200584330040_R03C02             high 200584330040_R03C02 0.9926 0.01695457
# 12  06C57697 SM-CN98Q 200584330131_R12C01             high 200584330131_R12C01 0.9952 0.04350608
# 13  06C58055 SM-CMQ3P 200598830108_R11C02             high 200598830108_R11C02 0.9957 0.27511196
# 15  06C58743 SM-CN2GO 200584330068_R12C02             high 200584330068_R12C02 0.9930 0.01887396
# 18  08C72756 SM-CNGXT 200598720180_R12C02             high 200598720180_R12C02 0.9957 0.50863724
# 19  08C73198 SM-CMQAO 200496200038_R11C01             high 200496200038_R11C01 0.9957 0.38803583

# 2   03C23527 SM-CMQJ5 200598830088_R12C01              low 200598830088_R12C01 0.9957 0.09436980
# 3   04C25458 SM-CMQQD 200598830037_R09C02              low 200598830037_R09C02 0.9957 0.11420345
# 4   04C27289 SM-CMQLA 200598830150_R10C01              low 200598830150_R10C01 1.0000 0.75111964
# 6   05C41487 SM-CMQLX 200598830150_R09C01              low 200598830150_R09C01 1.0000 0.69353807
# 7   05C44589 SM-CNGQC 200598160055_R08C01              low 200598160055_R08C01 1.0000 0.68330134
# 8   05C46666 SM-CN91I 200584330056_R02C01              low 200584330056_R02C01 0.9979 0.65674984
# 14  06C58374 SM-CN2DT 200584330115_R07C02              low 200584330115_R07C02 1.0000 0.93410109
# 16  08C72647 SM-CN2ZH 200584330034_R02C01              low 200584330034_R02C01 0.9957 0.46896993
# 17  08C72666 SM-CMQQO 200598830037_R08C01              low 200598830037_R08C01 1.0000 0.73512476
# 20 10C110060 SM-CNGX4 200598720180_R03C02              low 200598720180_R03C02 1.0000 0.89699296




## get het numbers from both GAP and VCF

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')


## ============= these .het files are from Ricopili QC ==============

a_het <- read.table('cau1_eur_GAP_full.het',h=T,stringsAsFactors=F)
# a_het <- read.table('cau1_eur_GAP_auto.het',h=T,stringsAsFactors=F)
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.
v_het <- read.table('cau1_eur_VCF_full.het',h=T,stringsAsFactors=F)
# v_het <- read.table('cau1_eur_VCF_auto.het',h=T,stringsAsFactors=F)
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.

het <- merge(a_het,v_het,by='IID',all=F)
dim(het) ## 3126

## get variables
het$HET_RATE_DIFF <- het$HET_RATE.x - het$HET_RATE.y
het$HET_RATE_ABS_DIFF <- abs(het$HET_RATE_DIFF)
het <- het[order(het$HET_RATE_DIFF),]
het$HET_RATE_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)
het <- het[order(het$HET_RATE_ABS_DIFF),]
het$HET_RATE_ABS_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)

t.test(het$HET_RATE.x,het$HET_RATE.y)
# t = -12.549, df = 6244.4, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.0011735607 -0.0008564384
# sample estimates:
# mean of x mean of y 
# 0.2318918 0.2329068 

## create histogram of difference
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_HETdiff.pdf',height=6,width=12)

par(mfrow=c(1,2))

## MAF scatterplot
hist(het$HET_RATE_DIFF,col='navyblue',breaks=100,
	main='Het rate difference (VCF vs GAP)',xlab='GAP Het rate - VCF het rate')
abline(v=0,lty=2,col='red')

## MAF scatterplot
boxplot(het$HET_RATE_DIFF,col='navyblue',
	main='',ylab='GAP Het rate - VCF het rate')
abline(h=0,lty=2,col='red')

dev.off()


het2 <- het[,c('IID','HET_RATE.x','HET_RATE.y','HET_RATE_DIFF','HET_RATE_ABS_DIFF','HET_RATE_DIFF_PCT','HET_RATE_ABS_DIFF_PCT')]
colnames(het2)[2] <- 'HET_RATE_GAP'
colnames(het2)[3] <- 'HET_RATE_VCF'

write.table(het2,'cau1_eur_COMB.matchID.het.txt',col=T,row=F,quo=F,sep='\t')


## ============= these .het files are from Ricopili QC (but using GAP 2caller) ==============

a_het <- read.table('cau1_eur_GAP2call_full.het',h=T,stringsAsFactors=F)
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.
v_het <- read.table('cau1_eur_VCF_full.het',h=T,stringsAsFactors=F)
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.

het <- merge(a_het,v_het,by='IID',all=F)
dim(het) ## 3127

## get variables
het$HET_RATE_DIFF <- het$HET_RATE.x - het$HET_RATE.y
het$HET_RATE_ABS_DIFF <- abs(het$HET_RATE_DIFF)
het <- het[order(het$HET_RATE_DIFF),]
het$HET_RATE_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)
het <- het[order(het$HET_RATE_ABS_DIFF),]
het$HET_RATE_ABS_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)

t.test(het$HET_RATE.x,het$HET_RATE.y)
# t = -22.457, df = 6243.1, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.001966778 -0.001650973
# sample estimates:
# mean of x mean of y 
# 0.2310981 0.2329070 

## create histogram of difference
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP2call_VCF_HETdiff.pdf',height=6,width=12)

par(mfrow=c(1,2))

## MAF scatterplot
hist(het$HET_RATE_DIFF,col='navyblue',breaks=100,
	main='Het rate difference (VCF vs GAP 2 caller)',xlab='GAP Het rate - VCF het rate')
abline(v=0,lty=2,col='red')

## MAF scatterplot
boxplot(het$HET_RATE_DIFF,col='navyblue',
	main='',ylab='GAP Het rate - VCF het rate')
abline(h=0,lty=2,col='red')

dev.off()




## lets windsorize the data
het2 <- het[300:nrow(het)-300,]
t.test(het2$HET_RATE.x,het2$HET_RATE.y)
## still signal there!!!!





## ============= these .het files are AUTOSOMES from Ricopili QC ==============

a_het <- read.table('cau1_eur_GAP_auto.het',h=T,stringsAsFactors=F)
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.
v_het <- read.table('cau1_eur_VCF_auto.het',h=T,stringsAsFactors=F)
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.

het <- merge(a_het,v_het,by='IID',all=F)
dim(het) ## 3126

## get variables
het$HET_RATE_DIFF <- het$HET_RATE.x - het$HET_RATE.y
het$HET_RATE_ABS_DIFF <- abs(het$HET_RATE_DIFF)
het <- het[order(het$HET_RATE_DIFF),]
het$HET_RATE_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)
het <- het[order(het$HET_RATE_ABS_DIFF),]
het$HET_RATE_ABS_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)

t.test(het$HET_RATE.x,het$HET_RATE.y)
# t = -22.432, df = 6243.1, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.00196505 -0.00164920
# sample estimates:
# mean of x mean of y 
# 0.2311241 0.2329312 

## lets windsorize the data
het <- het[order(het$HET_RATE_DIFF),]
het2 <- het[500:nrow(het)-500,]
t.test(het2$HET_RATE.x,het2$HET_RATE.y)
# t = -21.207, df = 5243.6, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.002079672 -0.001727715
# sample estimates:
# mean of x mean of y 
# 0.2311476 0.2330513 

## create histogram of difference
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_HETdiff_autosome.pdf',height=6,width=12)

par(mfrow=c(1,2))

## MAF scatterplot
hist(het$HET_RATE_DIFF,col='navyblue',breaks=100,
	main='Het rate difference (VCF vs GAP)',xlab='GAP Het rate - VCF het rate')
abline(v=0,lty=2,col='red')

## MAF scatterplot
boxplot(het$HET_RATE_DIFF,col='navyblue',
	main='',ylab='GAP Het rate - VCF het rate')
abline(h=0,lty=2,col='red')

dev.off()







## ============= these .het files are AUTOSOMES from Ricopili QC (but using GAP 2caller) ==============

a_het <- read.table('cau1_eur_GAP2call_auto.het',h=T,stringsAsFactors=F)
a_het$HET_RATE <- (a_het$N.NM. - a_het$O.HOM.) / a_het$N.NM.
v_het <- read.table('cau1_eur_VCF_auto.het',h=T,stringsAsFactors=F)
v_het$HET_RATE <- (v_het$N.NM. - v_het$O.HOM.) / v_het$N.NM.

het <- merge(a_het,v_het,by='IID',all=F)
dim(het) ## 3127

## get variables
het$HET_RATE_DIFF <- het$HET_RATE.x - het$HET_RATE.y
het$HET_RATE_ABS_DIFF <- abs(het$HET_RATE_DIFF)
het <- het[order(het$HET_RATE_DIFF),]
het$HET_RATE_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)
het <- het[order(het$HET_RATE_ABS_DIFF),]
het$HET_RATE_ABS_DIFF_PCT <- seq(1,nrow(het),1) / nrow(het)

t.test(het$HET_RATE.x,het$HET_RATE.y)
# t = -22.432, df = 6243.1, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.00196505 -0.00164920
# sample estimates:
# mean of x mean of y 
# 0.2311241 0.2329312 

## lets windsorize the data
het2 <- het[500:nrow(het)-500,]
t.test(het2$HET_RATE.x,het2$HET_RATE.y)
# t = -21.349, df = 5240.9, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.001977047 -0.001644494
# sample estimates:
# mean of x mean of y 
# 0.2311575 0.2329683 

## create histogram of difference
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP2call_VCF_HETdiff_autosome.pdf',height=6,width=12)

par(mfrow=c(1,2))

## MAF scatterplot
hist(het$HET_RATE_DIFF,col='navyblue',breaks=100,
	main='Het rate difference (VCF vs GAP 2 caller autosomes)',xlab='GAP Het rate - VCF het rate')
abline(v=0,lty=2,col='red')

## MAF scatterplot
boxplot(het$HET_RATE_DIFF,col='navyblue',
	main='',ylab='GAP Het rate - VCF het rate')
abline(h=0,lty=2,col='red')

dev.off()




## ----- check HWE across autosomes

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

library(data.table)
a_hwe <- fread('cau1_eur_GAP_full.hwe',stringsAsFactors=F)
a_hwe <- subset(a_hwe,a_hwe$TEST=='ALL' & a_hwe$CHR < 23)
colnames(a_hwe)[7] <- 'O.HET.'
colnames(a_hwe)[8] <- 'E.HET.'


v_hwe <- fread('cau1_eur_VCF_full.hwe',stringsAsFactors=F)
v_hwe <- subset(v_hwe,v_hwe$TEST=='ALL' & v_hwe$CHR < 23)
colnames(v_hwe)[7] <- 'O.HET.'
colnames(v_hwe)[8] <- 'E.HET.'


## Graph comparing the 2 sets
pdf('/home/unix/howrigan/private_html/psychchip/sc_genotyping/Part2_GAP_VCF_HWE_full.pdf',height=8.5,width=11)

par(mfrow=c(1,2))

## Obs / Exp GAP
xlims <- c(0,max(a_hwe$E.HET.,na.rm=T))
ylims <- c(0,max(a_hwe$O.HET.,na.rm=T))
smoothScatter(a_hwe$E.HET.,a_hwe$O.HET.,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Expected HET',ylab='Observed HET',main='GAP')
# points(a_hwe$E.HET.[a_hwe$P < 0.05],a_hwe$O.HET.[a_hwe$P < 0.05],pch=16,cex=0.8,col='orange')
points(a_hwe$E.HET.[a_hwe$P < (0.05/nrow(a_hwe))],a_hwe$O.HET.[a_hwe$P < (0.05/nrow(a_hwe))],pch=16,cex=0.8,col='red')
abline(0,1,lwd=2)

## Obs / Exp VCF
xlims <- c(0,max(v_hwe$E.HET.,na.rm=T))
ylims <- c(0,max(v_hwe$O.HET.,na.rm=T))
smoothScatter(v_hwe$E.HET.,v_hwe$O.HET.,col='navyblue',pch=16,cex=0.8,xlim=xlims,ylim=ylims,
	xlab='Expected HET',ylab='Observed HET',main='VCF')
# points(v_hwe$E.HET.[v_hwe$P < 0.05],v_hwe$O.HET.[v_hwe$P < 0.05],pch=16,cex=0.8,col='orange')
points(v_hwe$E.HET.[v_hwe$P < (0.05/nrow(v_hwe))],v_hwe$O.HET.[v_hwe$P < (0.05/nrow(v_hwe))],pch=16,cex=0.8,col='red')
abline(0,1,lwd=2)

dev.off()
## END of GRAPH

## lets merge the hwe with MAF > 0.3

a_hwe2 <- subset(a_hwe,a_hwe$O.HET. > 0.35)
v_hwe2 <- subset(v_hwe,v_hwe$O.HET. > 0.35)

mrg <- merge(a_hwe2,v_hwe2,by='SNP',all=F)

## get difference in HET
mrg$het_diff <- mrg$O.HET..x - mrg$O.HET..y
## sort by diff
mrg <- as.data.frame(mrg[order(mrg$het_diff,decreasing=T),])

## write out extreme SNPs
chk <- mrg[,c('CHR.x','SNP','O.HET..x','E.HET..x','P.x','O.HET..y','E.HET..y','P.y','het_diff')]
chk1 <- chk[c(1:10,(nrow(chk)-10):nrow(chk)),]
names(chk1) <- c('CHR','SNP','OBS_HET_GAP','EXP_HET_GAP','HWE_P_GAP','OBS_HET_VCF','EXP_HET_VCF','HWE_P_VCF','HET_DIFF')
write.table(chk1,'SNPs_GAP_VCF_HetDiff.txt',col=T,row=F,quo=F,sep='\t')







## combining all stats into a single file

setwd('/psych/genetics_data/howrigan/projects/sc_genotyping/subsamp2')

genome <- read.table('cau1_eur_COMB.matchID.genome.txt',h=T)
miss <- read.table('cau1_eur_COMB.matchID.imiss.txt',h=T)
het <- read.table('cau1_eur_COMB.matchID.het.txt',h=T)

mrg1 <- merge(genome,miss,by.x='IID1',by.y='IID',all=F)
dim(mrg1) ## 3126
mrg2 <- merge(mrg1,het,by.x='IID1',by.y='IID',all=F)
dim(mrg2) ## 3126

write.table(mrg2,'cau1_eur_COMB_descriptives.txt',col=T,row=F,quo=F,sep='\t')
## upload to computer





## HOME COMPUTER
setwd('/Users/daniel/Dropbox (Partners HealthCare)/PsychChip/sc_genotyping')

dat <- read.table('cau1_eur_COMB_descriptives.txt',h=T,stringsAsFactors=F)
samp <- read.table('extreme_samples.txt',h=T,stringsAsFactors=F)

samp2 <- merge(samp,dat,by.x='IID',by.y='IID1',all.x=T)

write.table(samp2,'extreme_samples_descriptives.txt',col=T,row=F,quo=F,sep='\t')

gen <- dat[order(dat$pct),]
write.table(gen[1:10,],'low_pi_hat.txt',col=T,row=F,quo=F,sep='\t')

miss <- dat[order(dat$GENO_ABS_DIFF,decreasing=T),]
write.table(miss[1:10,],'high_missing_diff.txt',col=T,row=F,quo=F,sep='\t')

het <- dat[order(dat$HET_RATE_ABS_DIFF,decreasing=T),]
write.table(het[1:10,],'high_het_diff.txt',col=T,row=F,quo=F,sep='\t')




## =============== Checking single sample intensity from a VCF file


GT:BAF:GTA:GTZ:IGC:LRR:NORMX:NORMY:R:THETA:X:Y

bcftools view -Oz -s 200496200003_R01C01 arrays3k_first1000.vcf.gz > tmp.vcf.gz
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%LRR\t%NORMX\t%NORMY\t%R\t%THETA\t%X\t%Y]\n' tmp.vcf.gz -s 200496200003_R01C01 > 200496200003_R01C01.gtc

bcftools view -Ou -s 200496200003_R01C01 tmp.vcf.gz | bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%LRR\t%NORMX\t%NORMY\t%R\t%THETA\t%X\t%Y]\n' > 200496200003_R01C01.gtc

bcftools view -Ou -s 200496200003_R01C01 /seq/tng/ggrant/3KCallSet/bestCallsetEver020817.final.vcf.gz | bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%LRR\t%NORMX\t%NORMY\t%R\t%THETA\t%X\t%Y]\n' > 200496200003_R01C01.gtc
# 3256.978u 24.139s 56:37.02 96.5%	0+0k 68822448+63624io 0pf+0w
## took 56 minutes!!


## comparing numbers between files:

head -n 100 /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/gtc/gtc/200496200003/200496200003_R01C01.gtc.txt > \
/psych/genetics_data/howrigan/projects/sc_genotyping/first100lines_200496200003_R01C01.gtc.txt

tail -n 100 /psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/gtc/gtc/200496200003/200496200003_R01C01.gtc.txt > \
/psych/genetics_data/howrigan/projects/sc_genotyping/last100lines_200496200003_R01C01.gtc.txt



About:   Extracts fields from VCF/BCF file and prints them in user-defined format
Usage:   bcftools query [options] <A.vcf.gz> [<B.vcf.gz> [...]]

Options:
    -c, --collapse <string>           collapse lines with duplicate positions for <snps|indels|both|all|some|none>, see man page [none]
    -e, --exclude <expr>              exclude sites for which the expression is true (see man page for details)
    -f, --format <string>             see man page for details
    -H, --print-header                print header
    -i, --include <expr>              select sites for which the expression is true (see man page for details)
    -l, --list-samples                print the list of samples and exit
    -o, --output-file <file>          output file name [stdout]
    -r, --regions <region>            restrict to comma-separated list of regions
    -R, --regions-file <file>         restrict to regions listed in a file
    -s, --samples <list>              list of samples to include
    -S, --samples-file <file>         file of samples to include
    -t, --targets <region>            similar to -r but streams rather than index-jumps
    -T, --targets-file <file>         similar to -R but streams rather than index-jumps
    -v, --vcf-list <file>             process multiple VCFs listed in the file

Examples:
	bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%SAMPLE=%GT]\n' file.vcf.gz





## Read in and compare CNV files:


library(data.table)
gtc <- fread('/psych/genetics_data/stored_data/genotyping/gpc_cogs_cau_psych_2017/gtc/gtc/200496200003/200496200003_R01C01.gtc.txt',skip=11,h=T,sep='\t')

vcf <- fread('200496200003_R01C01.gtc',sep='\t')
names(vcf) <- c('CHROM','POS','REF','ALT','LRR','NORMX','NORMY','R','THETA','X','Y')

## --- select chromosome 15

gtc2 <- subset(gtc,gtc$Chromosome=='15')
dim(gtc2) ## 18690
gtc2 <- gtc2[order(gtc2$Position),]

vcf2 <- subset(vcf,vcf$CHROM=='15')
dim(vcf2) ## 18496
vcf2 <- vcf2[order(vcf2$POS),]

# head(gtc2)
#          SNP Name Chromosome Position  GC Score Allele1 - Top Allele2 - Top Allele1 - AB Allele2 - AB         X          Y Raw X Raw Y R Illumina Theta Illumina bAllele Freq Log R Ratio Illumina
# 1: psy_rs11636586         15 20153587 0.3010174             A             A            A            A 3.0466945 0.45999074 21314  2087  3.5066853     0.09539652   0.00000000           0.18515094
# 2:      rs6599770         15 20161372 0.6935989             A             C            A            B 0.3221124 0.28957364  1755   933  0.6116860     0.46616680   0.46977443          -0.02216775
# 3:     rs12440100         15 20177092 0.8189092             A             G            A            B 0.4580882 0.50937960  2148  1414  0.9674678     0.53371960   0.47037855           0.01607718
# 4:     rs12906138         15 20184600 0.8704421             A             G            A            B 0.3260195 0.45625442  1791  1463  0.7822739     0.60502280   0.50674340          -0.01201773
# 5:  psy_rs7496731         15 20189247 0.8678432             A             G            A            B 0.9237797 0.74674150  6639  3048  1.6705211     0.43278330   0.44463825           0.15307875
# 6:      rs7179358         15 20191741 0.8481050             A             A            A            A 0.4864323 0.05873126  2618   201  0.5451636     0.07649444   0.04573678          -0.51891280

# head(vcf2)
#    CHROM      POS REF ALT    LRR NORMX NORMY     R THETA     X    Y
# 1:    15 20153587   C   T  0.184 3.045 0.460 3.505 0.095 21314 2087
# 2:    15 20161372   A   C -0.022 0.322 0.290 0.612 0.466  1755  933
# 3:    15 20177092   G   A  0.016 0.458 0.509 0.968 0.534  2148 1414
# 4:    15 20184600   G   A -0.012 0.326 0.456 0.782 0.605  1791 1463
# 5:    15 20189247   C   T  0.153 0.924 0.747 1.671 0.433  6639 3048
# 6:    15 20191741   A   G -0.519 0.486 0.059 0.545 0.077  2618  201

## VERDICT: looks good to me...

## check to see if bAllele Freq and AB are in VCF too






























































































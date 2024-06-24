/* Programa para realizar o pos processamento de arquivos report do Kraken. Para todas as amostras ele deve encontrar a quantidade de reads nao classificados para cada nivel taxonomico, fazer a media entre todas as amostras.

Entrada: numero de amostras, limite para considerar presente na amostra,

Saida: arquivo .txt com a tabela dos niveis taxonomicos e a porcentagem de reads nao classificados para cada taxon

*/

#define MAX_FILE 51

#define MAX_AUX 501

#define MAX_ID 3000

#define MAX_CODE 5

#include <stdio.h>

#include <stdlib.h>

#include <math.h>

#include <string.h> #include <stdbool.h>

int pertence(int x, int v[], int n) { int i;

for(i=0; i<n; i++) { if(x == v[i]) return i; }

return -1; } int main() {

int n, i, j, x, n_ID_esp, n_ID_gen, n_reads, ID, cont; bool ID_binario_esp[MAX_ID], ID_binario_gen[MAX_ID]; char ID_nome[MAX_ID][MAX_AUX], code[MAX_CODE]; int vetor_ID_esp[MAX_AUX], vetor_ID_gen[MAX_AUX]; float p_reads, lim; float p_unc=0, p_fil=0, p_cla=0, p_ord=0, p_fam=0, p_gen=0, p_esp=0; float **m_out1;

float **m_out2; char nome_arq_in[MAX_FILE]; char aux[MAX_AUX], nome_taxon[MAX_AUX]; char **arquivos; FILE *arq; FILE *arq2;

for(i=0; i<MAX_ID; i++) ID_binario_esp[i] = 0;

for(i=0; i<MAX_ID; i++) ID_binario_gen[i] = 0;

for(i=0; i<MAX_AUX; i++) vetor_ID_esp[i] = -1;

for(i=0; i<MAX_AUX; i++) vetor_ID_gen[i] = -1;

printf("Numero de amostras:\n"); scanf("%d", &n); printf("Limite de porcentagem para escolher o taxon:\n"); scanf("%f", &lim); printf("Arquivos separados por ’enter’:\n");

arquivos = malloc(n*sizeof(char*)); for(i=0; i<n; i++) arquivos[i] = malloc(MAX_FILE*sizeof(char));

for(i=0; i<n; i++) { scanf("%s", nome_arq_in); strcpy(arquivos[i], nome_arq_in); arq = fopen(nome_arq_in, "r"); if(arq==NULL) { printf("Erro ao abrir arquivo %s\n", nome_arq_in); exit(1); }

while(fscanf(arq, "%f", &p_reads) != EOF) { fscanf(arq, "%d", &n_reads); fscanf(arq, "%d", &n_reads); fscanf(arq, "%s", code); fscanf(arq, "%d", &ID); fscanf(arq, " "); fgets(nome_taxon, MAX_AUX, arq);

if(strlen(code) == 1) { if(code[0] == ’U’) p_unc += p_reads;

else if(code[0] == ’P’) p_fil += p_reads; else if(code[0] == ’C’) p_cla +=p_reads; else if(code[0] == ’O’) p_ord +=p_reads; else if(code[0] == ’F’) p_fam +=p_reads; else if(code[0] == ’G’) { p_gen +=p_reads; if(p_reads >= lim) { ID_binario_gen[ID] = 1; strcpy(ID_nome[ID], nome_taxon); x = strlen(nome_taxon); ID_nome[ID][x-1] = ’\0’;

} } else if(code[0] == ’S’) p_esp +=p_reads; }

if((code[0] == ’S’)&&(p_reads >= lim)) { ID_binario_esp[ID] = 1; strcpy(ID_nome[ID], nome_taxon); x = strlen(nome_taxon); ID_nome[ID][x-1] = ’\0’;

} } fclose(arq); }

/* Criar arquivo com % de n classificados de todos os taxons: */ arq2 = fopen("total_kraken.csv", "w"); p_unc = p_unc/n; p_fil = p_fil/n; p_cla = p_cla/n; p_ord = p_ord/n; p_fam = p_fam/n; p_gen = p_gen/n; p_esp = p_esp/n; fprintf(arq2, "Nivel_taxonomico,nao_classificados,nao_classificaveis,total\n");

fprintf(arq2, "Filo,%f,%f,%f\n", (100-p_fil-p_unc), p_unc, (100-p_fil)); fprintf(arq2, "Classe,%f,%f,%f\n", (100-p_cla-p_unc), p_unc, (100-p_cla)); fprintf(arq2, "Ordem,%f,%f,%f\n", (100-p_ord-p_unc), p_unc, (100-p_ord)); fprintf(arq2, "Familia,%f,%f,%f\n", (100-p_fam-p_unc), p_unc, (100-p_fam)); fprintf(arq2, "Genero,%f,%f,%f\n", (100-p_gen-p_unc), p_unc, (100-p_gen)); fprintf(arq2, "Especie,%f,%f,%f\n", (100-p_esp-p_unc), p_unc, (100-p_esp)); fclose(arq2);

n_ID_gen=0; for(i=0; i<MAX_ID; i++) { if(ID_binario_gen[i] == 1) { vetor_ID_gen[n_ID_gen] = i; n_ID_gen++; } } n_ID_esp=0; for(i=0; i<MAX_ID; i++) { if(ID_binario_esp[i] == 1) { vetor_ID_esp[n_ID_esp] = i; n_ID_esp++; } }

m_out1 = malloc(n*sizeof(float*)); for(i=0; i<n; i++) m_out1[i] = malloc(n_ID_gen*sizeof(float)); for(i=0; i<n; i++) for(j=0; j<n_ID_gen; j++) m_out1[i][j] = 0;

m_out2 = malloc(n*sizeof(float*)); for(i=0; i<n; i++) m_out2[i] = malloc(n_ID_esp*sizeof(float)); for(i=0; i<n; i++) for(j=0; j<n_ID_esp; j++) m_out2[i][j] = 0;

for(i=0; i<n; i++) { arq = fopen(arquivos[i], "r"); if(arq==NULL) { printf("Erro ao abrir arquivo %s\n", arquivos[i]); exit(1); } while(fscanf(arq, "%f", &p_reads) != EOF) { fscanf(arq, "%d", &n_reads); fscanf(arq, "%d", &n_reads); fscanf(arq, "%s", code); fscanf(arq, "%d", &ID); fscanf(arq, " "); fgets(nome_taxon, MAX_AUX, arq); x = pertence(ID, vetor_ID_gen, n_ID_gen); if(x != -1) m_out1[i][x] = p_reads; else{ x = pertence(ID, vetor_ID_esp, n_ID_esp); if(x != -1) m_out2[i][x] = p_reads;

} } fclose(arq); }

arq2 = fopen("tabela_genero.csv", "w"); fprintf(arq2, "Amostra"); for(i=0; i<n_ID_gen; i++) { fprintf(arq, ",%s", ID_nome[vetor_ID_gen[i]]); } fprintf(arq2, "\n");

for(i=0; i<n; i++) { x = i+1; fprintf(arq2, "%d", x); for(j=0; j<n_ID_gen; j++) fprintf(arq2, ",%f", m_out1[i][j]); fprintf(arq2, "\n"); } fclose(arq2);

arq2 = fopen("tabela_especie.csv", "w"); fprintf(arq2, "Amostra"); for(i=0; i<n_ID_esp; i++) { fprintf(arq, ",%s", ID_nome[vetor_ID_esp[i]]); } fprintf(arq2, "\n");

for(i=0; i<n; i++) { x = i+1; fprintf(arq2, "%d", x); for(j=0; j<n_ID_esp; j++) fprintf(arq2, ",%f", m_out2[i][j]); fprintf(arq2, "\n"); } fclose(arq2);

for(i=0; i<n; i++) free(arquivos[i]); free(arquivos);

for(i=0; i<n; i++) free(m_out1[i]); free(m_out1);

for(i=0; i<n; i++) free(m_out2[i]); free(m_out2);

return 0; 
}

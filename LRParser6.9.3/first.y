%{
#include "head.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define MAXCHILDREN 10 

typedef struct treeNode
{ 
	struct treeNode * child[MAXCHILDREN]; 
	struct treeNode * sibling;			 
	int Currnode_number;			   
	int lineCount;
	int wordCount;		  	 	
	int stmt_type;		
	int value;
	char *charvalue;
	struct symtab *symp; 		
}	treeNode;

int whole_Currnode_number = 1;	
treeNode * root = NULL;     
treeNode * new_treeNode;    
treeNode * new_TreeNode();
void node_print(treeNode * m);
void treenode_print(treeNode*m);
void tree_print();
	
%}

%union {
	struct treeNode *treenode;
	}

%token <treenode> ID
%token <treenode> NUM
%token COMMENTS
%token <treenode> IF
%token <treenode> ELSE
%token <treenode> WHILE
%token <treenode> THEN
%token <treenode> REAL
%token <treenode> INT
%token <treenode> GT
%token <treenode> GE
%token <treenode> LE
%token <treenode> LT
%token <treenode> EEQ
%token <treenode> EQ
%token <treenode> NE 
%token <treenode> ADD
%token <treenode> MIN
%token <treenode> MUL
%token <treenode> DIV
%token <treenode> LPAR
%token <treenode> RPAR
%token <treenode> LBRACES
%token <treenode> RBRACES
%token <treenode> SemicolSym 

%left '+' '-'
%left '*' '/'

%type <treenode> simpleexpr
%type <treenode> multexpr
%type <treenode> arithexprprime
%type <treenode> arithexpr
%type <treenode> assgstmt
%type <treenode> stmt 
%type <treenode> stmts
%type <treenode> program
%type <treenode> compoundstmt
%type <treenode> multexprprime
%type <treenode> ifstmt
%type <treenode> whilestmt 
%type <treenode> boolexpr
%type <treenode> boolop

%%
program :	compoundstmt {
				$$ = new_TreeNode();
				$$->child[0] = $1;
				root = $$ ;
				printf("program->compoundstmt;\n");
				tree_print();	
				printf("\n");
				}
	;


stmt    :	ifstmt       {
				printf("stmt->ifstmt;\n");
				$$ = new_TreeNode();
				$$->child[0] = $1;
				node_print($$);
				printf("\n");
				}

	|	whilestmt    {
				printf("stmt->whilestmt;\n");
				$$ = new_TreeNode();
				$$->child[0] = $1;
				node_print($$);
				printf("\n");
				}
	|	assgstmt     {
				printf("stmt->assgstmt;\n");
				$$ = new_TreeNode();
				$$->child[0] = $1;	
				node_print($$);
				printf("\n");
				}

	|	compoundstmt {
				printf("stmt->compoundstmt;\n");
				$$ = new_TreeNode();
				$$->child[0] = $1;
				node_print($$);
				printf("\n");
				}
	;


compoundstmt:	LBRACES stmts RBRACES {
					printf("compoundstmt->'{' stmts '}'\n");
					$$ = new_TreeNode();
					$1->Currnode_number = whole_Currnode_number;
					whole_Currnode_number++;
					$3->Currnode_number = whole_Currnode_number;
					whole_Currnode_number++;
					$$->child[0] = $1;
					$$->child[1] = $2;
					$$->child[2] = $3;
					$1->sibling = $2;
					$2->sibling = $3;
					node_print($$);	
					printf("\n");
					}
	;  


stmts   :	stmt stmts   {
				printf("stmts->stmt stmts\n");
				$$ = new_TreeNode();
				$$->child[0] = $1;
				$$->child[1] = $2;
				$1->sibling = $2;			
				node_print($$);
				printf("\n");				
				}
	|	{
		printf("stmts->    ;\n");
		$$ = new_TreeNode();
		node_print($$);
		printf("\n");
		}
	;


ifstmt	:	IF LPAR boolexpr RPAR THEN stmt ELSE stmt    {	
								printf("if->IF '(' boolexpr ')' THEN stmt ELSE stmt \n");
								$$ = new_TreeNode();
								$$->child[0] = $1;
								$$->child[1] = $2;
								$$->child[2] = $3;
								$$->child[3] = $4;
								$$->child[4] = $5;
								$$->child[5] = $6;
								$$->child[6] = $7;
								$$->child[7] = $8;
								$1->Currnode_number = whole_Currnode_number;
								whole_Currnode_number++;
								$2->Currnode_number = whole_Currnode_number;
								whole_Currnode_number++;
								$4->Currnode_number = whole_Currnode_number;
								whole_Currnode_number++;
								$5->Currnode_number = whole_Currnode_number;
								whole_Currnode_number++;
								$7->Currnode_number = whole_Currnode_number;
								whole_Currnode_number++;
								$1->sibling = $2;
								$2->sibling = $3;
								$3->sibling = $4;
								$4->sibling = $5;
								$5->sibling = $6;
								$6->sibling = $7;
								$7->sibling = $8;
								node_print($$);
								printf("\n");							
								}
	;


whilestmt:	WHILE LPAR boolexpr RPAR stmt   {	
						printf("while->WHILE '(' boolexpr ')' stmt ;\n");
						$$ = new_TreeNode();
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$$->child[3] = $4;
						$$->child[4] = $5;
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$2->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$4->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$1->sibling = $2;
						$2->sibling = $3;
						$3->sibling = $4;
						$4->sibling = $5;
						node_print($$);
						printf("\n");
						}				
	;


assgstmt:	ID EQ arithexpr SemicolSym {
						printf("assgstmt->ID '=' arithexpr;\n");
						$$ = new_TreeNode();
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$$->child[3] = $4;
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$2->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$4->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$1->sibling = $2;
						$2->sibling = $3;
						$3->sibling = $4;
						node_print($$);
						printf("\n");						
						}
	;      


boolexpr:	arithexpr boolop arithexpr {
						printf("boolexpr->arithexpr boolop arithexpr\n");
						$$ = new_TreeNode();
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$1->sibling = $2;
						$2->sibling = $3;
						node_print($$);
						printf("\n");	
						}
	;   


boolop	:	LT  {	
			printf("boolop->'<';\n");
			$1->Currnode_number = whole_Currnode_number;
			printf("Children_value='<'\n");
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");
			}
	|  	GT  {	
			printf("boolop->'>';\n");
			$1->Currnode_number = whole_Currnode_number;
			printf("Children_value='>'");
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");
			}
	|  	LE  {
			printf("stmt->'<=';\n");
			$1->Currnode_number = whole_Currnode_number;
			printf("Children_value='<='");
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");
			}
	|  	GE  {
			printf("stmt->'>=';\n");
			$1->Currnode_number = whole_Currnode_number;
			printf("Children_value='>='");
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");
			}
	| 	EEQ {
			printf("stmt->'==';\n");
			$1->Currnode_number = whole_Currnode_number;
			printf("Children_value='=='");
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");
			}
	;


arithexpr:	multexpr arithexprprime {
					printf("arithexpr->multexpr arithexprprime;\n");
					$$ = new_TreeNode();
					$$->child[0] = $1;
					$$->child[1] = $2;
					$1->sibling = $2;			
					node_print($$);	
					printf("\n");
					}
	;    


arithexprprime:	ADD multexpr arithexprprime  {
						printf("arithexprprime->'+' multexpr arithexprprime;\n");
						$$ = new_TreeNode();
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$1->sibling = $2;
						$2->sibling = $3;		
						node_print($$);	
						printf("\n");
						}
	|  	MIN multexpr arithexprprime  {
						printf("arithexprprime->'-' multexpr arithexprprime;\n");
						$$ = new_TreeNode();
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$1->sibling = $2;
						$2->sibling = $3;		
						node_print($$);	
						printf("\n");
						} 

	|	{
		printf("arithexprprime-> \n");
		$$ = new_TreeNode();
		node_print($$);
		printf("\n");
		}
	;


multexpr:	simpleexpr  multexprprime {
						printf("multexpr->simpleexpr multexprprime\n");	
						$$ = new_TreeNode();
						$$->child[0] = $1;
						$$->child[1] = $2;
						$1->sibling = $2;			
						node_print($$);	
						printf("\n");
						}
			
	;


multexprprime:	MUL simpleexpr multexprprime  {
						printf("multexprprime->'*' simpleexpr multexprprime;\n");
						$$ = new_TreeNode();
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$1->sibling = $2;
						$2->sibling = $3;		
						node_print($$);	
						printf("\n");
						}
	|  	DIV simpleexpr multexprprime  {
						printf("multexprprime->'/' simpleexpr multexprprime;\n");
						$$ = new_TreeNode();
						$1->Currnode_number = whole_Currnode_number;
						whole_Currnode_number++;
						$$->child[0] = $1;
						$$->child[1] = $2;
						$$->child[2] = $3;
						$1->sibling = $2;
						$2->sibling = $3;				
						node_print($$);	
						printf("\n");
						}
	|	{
		printf("multexprprime->    \n");
		$$ = new_TreeNode();
		node_print($$);
		printf("\n");
		}
	;


simpleexpr:	ID     {
			printf("simpleexpr->ID;\n");
			$1->Currnode_number = whole_Currnode_number;
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");	
			}

	|  	NUM     {
			printf("simpleexpr->NUM;\n");
			$1->Currnode_number = whole_Currnode_number;
			whole_Currnode_number++;
			$$ = new_TreeNode();
			$$->child[0] = $1;
			node_print($$);
			printf("\n");	
			}
	|  	LPAR arithexpr RPAR  {
					printf("simpleexpr->'(' arithexpr ')';\n");
					$$ = new_TreeNode();
					$1->Currnode_number = whole_Currnode_number;
					whole_Currnode_number++;
					$3->Currnode_number = whole_Currnode_number;
					whole_Currnode_number++;
					$$->child[0] = $1;
					$$->child[1] = $2;
					$$->child[2] = $3;	
					$1->sibling = $2;
					$2->sibling = $3;					
					node_print($$);	
					printf("\n");
					}
	;


%%

extern FILE* yyin;
int main(int argc, char **argv) {
        if (argc > 1) {
                yyin = fopen(argv[1], "r");
        } else {
                fprintf(stdout, "Usage: config <file_path>\n");
                exit(1);
        }
        if (yyin == NULL) {
                fprintf(stdout, "config: file access error. func=%s ", "fopen()");
                fprintf(stdout, "errno=%d(%s) name=%s\n", errno, strerror(errno), argv[0]);
                exit(1);
        }
        printf("### %s ###\n", argv[1]);
        yyparse();
        fclose(yyin);
        exit(0);
}


struct treeNode * new_TreeNode()				
{	
	struct treeNode *new_treeNode ;
        new_treeNode = (struct treeNode *) malloc(sizeof(struct treeNode)); 
	int i = 0;
	while(i<MAXCHILDREN)
	{
		new_treeNode->child[i] = NULL;
		i++;
	}		
	new_treeNode->sibling = NULL;		
	new_treeNode->lineCount = 0;	
	new_treeNode->wordCount = 0;
	new_treeNode->Currnode_number = whole_Currnode_number;
	new_treeNode->symp = NULL;
	new_treeNode->charvalue = NULL;
	whole_Currnode_number++;
	new_treeNode->stmt_type = 0;		
	return new_treeNode;
}



struct symtab *symlook(char *s)
{
	char *p;
	struct symtab *sp;
	
	for(sp = symtab; sp < &symtab[NSYMS]; sp++) {

		if(sp->name && !strcmp(sp->name, s))
			return sp;
		

		if(!sp->name) {
			sp->name = strdup(s);
		
			return sp;
		}
	
	}
	yyerror("Too many symbols");
	exit(1);	
}


void node_print(treeNode * m)		
{
	if(m == NULL)
	{
		return;
	}
	if(m->child[0] != NULL)
	{
		int i = 0;
		while(i<MAXCHILDREN)
		{
			if(m->child[i]==NULL)
			{
				printf("");
			}
			else
			{
				printf("Children_Number:%d\n" ,(m->child[i])->Currnode_number);	
				if(m->child[i]->symp !=NULL)
					printf("Children_Value:%s\n\n" ,(m->child[i])->symp->name);
				if(m->child[i]->charvalue !=NULL)
					printf("Children_value:%s\n\n" ,m->child[i]->charvalue);
					
			}
				i++;
		}
	}
}


void treenode_print(treeNode*m)
{
	if( m == NULL)
	{
		return;
	}
	
	if(m->child[0]==NULL)
	{
		node_print(m);
		return;
	}
	
	else
	{
		int i = 0;
		while(i<MAXCHILDREN)
		{
			treenode_print(m->child[i]);
			i++;
		}		
	}
	
	node_print(m);
}


void tree_print(void)				
{

		if(root == NULL)
		{
			printf("树为空\n");
		}
	
		else
		{
			treenode_print(root);
		}
		
}

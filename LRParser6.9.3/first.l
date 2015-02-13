%{
#include "y.tab.h"
#include "head.h"
#include <math.h>

int wordCount = 0;
int lineCount = 1;
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

treeNode * lnew_TreeNode();
	
%}

changeline  (\n)
comment1    ("/*"([^\*]|(\*)*[^\*/]|(\"\*\/\"))*(\*)*"*/"\n)
comment2    (\/\/.*)
%%

{changeline}	{   
                	lineCount++; 
                	wordCount=0;
                }	
    		
">" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = ">";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return GT;}

">="	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = ">=";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return GE;} 

"<="	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "<=";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return LE;}

"<"	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "<";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return LT;}

"==" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "==";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return EEQ;}

"=" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "=";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return EQ;}

"!=" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "!=";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return NE;}

"+" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "+";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return ADD;}

"-" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "-";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return MIN;}

"*" 	{
	wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "*";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return MUL;}

"/"	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "/";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return DIV;}

"(" 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "(";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return LPAR;}

")" 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = ")";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return RPAR;}

"{" 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "{";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return LBRACES;}

"}" 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "}";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return RBRACES;}

";"	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = ";";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return SemicolSym;}



if	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "if";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return IF;}

else	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "else";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return ELSE;}

while	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "while";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return WHILE;}

then	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "then";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return THEN;}	
				
int 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "int";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return INT;} 

real 	{
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->charvalue = "real";
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
	return REAL;}

{comment1}	{return COMMENTS;}
{comment2}	{return COMMENTS;}


([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->value = atof(yytext);
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
		return NUM;
	}

[A-Za-z][A-Za-z0-9]*	{	/* return symbol pointer */
		wordCount++;
		yylval.treenode = lnew_TreeNode();
		yylval.treenode->value = atof(yytext);
		yylval.treenode->symp = symlook(yytext);
		yylval.treenode->lineCount = lineCount;
		yylval.treenode->wordCount = wordCount;
		return ID;
	}


"$"	{ return 0; }

%%
treeNode * lnew_TreeNode()				
{	
	struct treeNode *lnew_treeNode ;
        lnew_treeNode = (struct treeNode *) malloc(sizeof(struct treeNode)); 
	int i = 0;
	while(i<MAXCHILDREN)
	{
		lnew_treeNode->child[i] = NULL;
		i++;
	}
	lnew_treeNode->sibling = NULL;		
	lnew_treeNode->lineCount = 0;
	lnew_treeNode->wordCount = 0;		
	lnew_treeNode->Currnode_number = 0;
	lnew_treeNode->stmt_type = 0;
	return lnew_treeNode;
}

yyerror(char *s)
{
printf("!!!-----linenumber(%d) wordnumber(%d):syntax error ! -----\n",lineCount,wordCount);
exit(1);
}

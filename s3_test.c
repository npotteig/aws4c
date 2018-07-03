#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include "aws4c.h"

int main(){

	aws_init ();
	aws_set_debug (1);

	aws_read_config ( "npotteig" );
	s3_set_bucket ("makeflowtestbucket");

	FILE *fp;
	fp = fopen("3.tar","wb");
	s3_get(fp, "3.tar");
	fclose(fp);
	return 1;

}

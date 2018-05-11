BEGIN { RS = "[ ,.]"
 }
{
 if(length($1) != 0) {   
 if($1 in words)
   words[$1] += 1 
 else
   words[$1] = 1
 }
}
END {
   PROCINFO["sorted_in"] = "@val_num_desc"
   for(i in words) {
       printf("%10s | ", i)
       for(j = 0; j < words[i]; j++)
       printf("=")
       printf(" (%d)\n", words[i]);
  }
}

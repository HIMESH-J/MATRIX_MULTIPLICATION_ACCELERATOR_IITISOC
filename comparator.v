module comparator_greater_than(output gt,input[3:0] a,b);
    wire[3:0] bdash;
    wire gt1,gt2,gt3;
    wire eq1,eq2,eq3,gt4;

    // implementing 4-bit comparator equation

    not(bdash[3],b[3]);  // first calcuation complement of each bit of b , which will come in use in comparator eqn
    not(bdash[2],b[2]);
    not(bdash[1],b[1]);
    not(bdash[0],b[0]);

    and(gt1,a[3],bdash[3]); // if a[3]>b[3] that means a>b

    xnor(eq1,a[3],b[3]); // else if a[3]==b[3] and a[2]>b[2] that means a>b
    and(gt2,eq1,a[2],bdash[2]);

    xnor(eq2,a[2],b[2]);  // else if a[3]==b[3] and a[2]==b[2] and a[1]>b[1] that means a>b
    and(gt3,eq1,eq2,a[1],bdash[1]);

    xnor(eq3,a[1],b[1]);  // else if a[1]==b[1] and a[2]==b[2] and a[3]==b[3] and a[0]>b[1] that means a>b
    and(gt4,eq3,eq2,eq1,a[0],bdash[0]);

    or(gt,gt4,gt3,gt2,gt1); //if any one of above conditons satisfy then a>b



endmodule    

module equality_checker(output out,input[3:0] a,b);        // outputs 1 if a is equal to be else outputs 0
    // for a to be equal to b all 4 bits of a and b must match
    // using xnor gates for bit-matching as a~^b=1 iff a=b
    wire temp[3:0];
    xnor(temp[3],a[3],b[3]);     
    xnor(temp[2],a[2],b[2]);
    xnor(temp[1],a[1],b[1]);
    xnor(temp[0],a[0],b[0]);
    
    and(out,temp[3],temp[2],temp[1],temp[0]);// a=b iff a[3]=b[3],a[2]=b[2],a[1]=b[1],a[0]=b[0]

endmodule

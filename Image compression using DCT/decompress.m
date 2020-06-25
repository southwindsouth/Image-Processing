%Task2_3_4
function [decom]= decompress(quantized,QP)
    Q=[
    16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99;
    ];
    if (QP>50)
        S= (100-QP)/50;
    elseif (QP<=50)
        S= 50/QP;   
    end
%decompress process
fun = @(block_struct)block_struct.data.*(S*Q);
imgDCT2= blockproc(quantized,[8 8],fun);
fun = @(block_struct)idct2(block_struct.data);
decom= blockproc(imgDCT2,[8 8],fun);
end 



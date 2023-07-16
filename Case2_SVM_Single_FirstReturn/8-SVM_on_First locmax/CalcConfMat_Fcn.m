function ConfMat = CalcConfMat_Fcn(ClassReal,ClassNet,ClassNum)
ConfMat = zeros(ClassNum);

for ii = 1:numel(ClassReal)
    ConfMat(ClassReal(ii),ClassNet(ii)) = ConfMat(ClassReal(ii),ClassNet(ii)) + 1;
end

end
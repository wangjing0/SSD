function [S,X]=ReighleyQuotient(A,B,ORDER,ORTH)
%Reighley quotient R(A,B)= x'Ax/x'Bx = X' S X / X'X
%find eigenvalue S, and corresponding eigenvector X
%ORDER='min', minimim first, ascend order of S, ORDER='max', descend order of S
%ORTH=1, orthogonalize eigenvectors.
% by Jing Wang, jingwang.physics@gmail.com, 05/23/2017 

if ishermitian(A) && ishermitian(B)
    [~,Sb,Vb]=svd(B);
    %C=Vb*sqrt(Sb);
    sbinv=1./sqrt(diag(Sb));
    Sbinv=diag(sbinv);
    D=Sbinv* Vb'*A*Vb*Sbinv;
    [~,S,V]=svd(D);
    X_=Vb*Sbinv*V;
    IND=[];
    for i=1:size(X_,2)
        x=X_(:,i);
        X_(:,i)=x./norm(x);
        if norm(x)<1e6
            IND=[IND;i];
        end
    end
    
    X=X_(:,IND); % remove bad columns, if it's rank deficient
    
    if strcmpi(ORDER, 'min')
        X=X(:,end:-1:1);
    end
    
    if ORTH
        [X,~]=qr(X);
    end
    
else
    disp('Error!A or B is not Hermitian.')
end

end
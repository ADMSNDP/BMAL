function H = myentropy(X,W)
[n m] = size(X);


H = zeros(1,m);
P =abs (W*X);

H = -sum(P .* log10(P));
end



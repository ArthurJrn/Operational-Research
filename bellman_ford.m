function [ y, prec, cycleneg ] = bellman_ford( G,s )
%BELLMAN_FORD trouver le plus court chemin entre un sommet s d'un graphe G
%jusqu'à tous les autres avec possibilité de poids négatif

n=max(size(G)) ; %n : nombre de sommet

y=inf*[1:n] ;
y(s) = 0 ;
prec=zeros(1,n) ;

for k=1:n-2
    
    for u=1:n
        for v=1:n
            if G(u,v) ~= 0 
                if y(v)>y(u)+G(u,v) 
                    y(v)=y(u)+G(u,v) ;
                    prec(v)=u ;  
                    
                end
            end
        end
    end
end

leave=0 ;
cycleneg=false ;

for u=1:n
    for v=1:n
        if G(u,v) ~= 0 
            if y(v)>y(u) + G(u,v)
                cycleneg = true ;
                leave=1 ;
                break
            end
        end
    if leave==1 
        break
    end
    end
end
        
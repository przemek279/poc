function wynik = funHome(nhood)
    if (nhood(2,2))
        wynik = (sum(nhood(:)) == 3 | sum(nhood(:)) == 4);
    else
        wynik = (sum(nhood(:)) == 3);
    end
end


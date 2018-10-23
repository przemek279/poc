function LUT(obraz,przekodowanie)
%LUT przekształca obraz zadanym przekodowaniem

    I = intlut(obraz, przekodowanie);
    figure;
    subplot(1,3,1);
    plot(przekodowanie);
    
    subplot(1,3,2);
    imshow(obraz);
    title('Oryginał');
    
    subplot(1,3,3);
    imshow(I);
    title('Przekodowany');
    
end

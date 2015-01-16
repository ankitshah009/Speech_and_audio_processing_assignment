function [removed_signal, fs] = read_remove(wavFileName)
[segments, fs] = detectVoiced(wavFileName);
m=length(segments);
removed_signal=0;
x=0;
hold off
for j=1:m
    y=length(segments{j});
    removed_signal(x+1:x+y)=segments{j};
    x=length(removed_signal);
end
 %plot(removed_signal);
 %sound(removed_signal);
end
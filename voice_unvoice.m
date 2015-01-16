%This is function is to separate out the voiced and the unvoiced sounds
function [voiced,unvoiced] = voice_unvoice(x)
voiced=0;
unvoiced=0;
m = length(x);
frame_length = m*20/1000;
no_frames = m / frame_length;
count = 0;count1 = 0;
for k = 1 : no_frames
    frame = x((k-1)*frame_length + 1 : k * frame_length);
    max_val = max(frame);
    min_val = min(frame);
    
    if(max_val > 0.3 && min_val < -0.3)
        count1 = count1 + 1;
        voiced((count1-1)*frame_length + 1 : count1 * frame_length) = frame;
    else
        count = count + 1;
        unvoiced((count-1)*frame_length + 1 : count * frame_length) = frame;
    end
end

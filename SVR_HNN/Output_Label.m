function [ Output_Lab ] = Output_Label( Actual_Mag, Threshold )
    % Actual_Mag = A(:,58);
    % Threshold = 5;
    Output_Lab =[];
    for i = 1:size(Actual_Mag,1);
        if Actual_Mag(i,1) >= Threshold
            Output_Lab = [Output_Lab; 1 0];
        end
        if Actual_Mag(i,1) < Threshold
            Output_Lab = [Output_Lab; 0 1];
        end

    end


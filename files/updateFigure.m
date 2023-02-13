



if fieldModel
    set(hPlot_f, 'XData', output_f);
    set(hPlot_pref, 'XData', output_pref);
    set(hPlot_c, 'XData', output_c);
else
    set(Ft_Det_Axis, 'YData', output_f);
    set(Ft_Exp_Axis, 'YData', output_pref);
    set(Category_Neuron_Axis, 'YData', output_c);
end

% three 2d fields are plotted with transpose so that x is horiz
% and y is vert.

set(Visual_Field_Axis, 'CData', flipud(sum(output_v,3)'));
set(Attention_Field_Axis, 'CData', output_a');
set(Saccade_Field_Axis, 'CData', output_s');
if ~environLoaded
    set(Spatial_Gain_Axis, 'CDdata', attPref');
end

if maxFields %&& trialTimeStep==1
    axes(Max_Att_Axis)
    cla
    axes(Max_Sacc_Axis)
    cla
    axes(Raw_Max_Sacc_Axis)
    cla
    axes(Raw_Max_Att_Axis)
    cla
    
    line([1:51],max((field_s')),'Parent',Raw_Max_Sacc_Axis,'Color','k');
    line([1:51],max((field_a')),'Parent',Raw_Max_Att_Axis,'Color','k');
    line(Max_Sacc_Axis,[1:51],max(fliplr(output_s')),'Color','b');
    line(Max_Att_Axis,[1:51],max(fliplr(output_a')),'Color','b');
    
    
    
%     hl_fs = line([1:51],max((field_s')),'Parent',Raw_Max_Sacc_Axis,'Color','k');
%     hl_fa = line([1:51],max((field_a')),'Parent',Raw_Max_Att_Axis,'Color','k');
%     hl_os = line(Max_Sacc_Axis,[1:51],max(fliplr(output_s')),'Color','b');
%     hl_oa = line(Max_Att_Axis,[1:51],max(fliplr(output_a')),'Color','b');
%     
%     hl_x = [1:51];
    
%     hl_fa.YDataSource = 'hl_fa_y';
%     hl_oa.YDataSource = 'hl_oa_y';
%     hl_fs.YDataSource = 'hl_fs_y';
%     hl_os.YDataSource = 'hl_os_y';


% 
% elseif maxFields && trialTimeStep>1
%     %
%     
%     hl_fs_y = max((field_s'));
%     hl_os_y = max((output_s'));
%     hl_fa_y = max((field_a'));
%     hl_oa_y = max((output_a'));
%     
%     
%     refreshdata(hl_fs);
%     refreshdata(hl_os);
%     refreshdata(hl_fa);
%     refreshdata(hl_oa);
%     

    
end

set(Weight_Axis, 'CData', output_wT');

if (~VisualSearch && ~SalienceMap)
    set(FoveaAxis, 'XData', [spatialFieldFovea(1)-spatialHalfSize], 'YData', [spatialFieldFovea(2)-spatialHalfSize] , 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 20);
elseif VisualSearch
    set(FoveaAxis, 'XData', [spatialFieldFovea(1)], 'YData', [spatialFieldFovea(2)] , 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 20);
end


if trialTimeStep==1 && (~VisualSearch && ~SalienceMap)
   axes(Screen_Display_Axis);
   for k = 1:locationNum
       viscircles([stimPos_x(k) stimPos_y(k)],stimSize_v(k)/4,'Color',featureColours(:,k)','LineWidth',10);
   end
   
elseif ((decisionFlag - firstFBTrialFlag) == 1) && (~VisualSearch && ~SalienceMap)
    
       axes(Screen_Display_Axis);
       text(stimPos_x(end), stimPos_y(end),num2str(category(trialNum)));
       
elseif trialTimeStep==1 && (VisualSearch || SalienceMap)
    
    axes(Screen_Display_Axis);
    ylim([1 51]);
    xlim([1 51]);
    colormap(Screen_Display_Axis,winter);
    imagesc(sum(stimuli_v(:,:,1:end-1),3)','AlphaDataMapping','scaled');
    
%     axes(FoveaAxis);
%     ylim([-spatialHalfSize spatialHalfSize]);
%     xlim([-spatialHalfSize spatialHalfSize]);
end




% set(F1_circle, 'XData', [stimPos_x(1)], 'YData', [stimPos_y(1)], 'MarkerFaceColor', featureColours(:,1)', 'MarkerEdgeColor', featureColours(:,1)', 'MarkerSize', 10);hold on
% if size(featureColours,2) >1
%     set(F2_circle, 'XData', [stimPos_x(2)], 'YData', [stimPos_y(2)], 'MarkerFaceColor', featureColours(:,2)', 'MarkerEdgeColor', featureColours(:,2)', 'MarkerSize', 10);hold on
% end
% if size(featureColours,2) >2
%     set(F3_circle, 'XData', [stimPos_x(3)], 'YData', [stimPos_y(3)], 'MarkerFaceColor', featureColours(:,3)', 'MarkerEdgeColor', featureColours(:,3)', 'MarkerSize', 10);hold on
% end
% %In case we're visualizing 4 features.
% if locationNum == 4
%     set(Screen_Display_Axis(6),'XData', [stimPos_x(4)], 'YData', [stimPos_y(4)], 'MarkerFaceColor', featureColours(:,4)', 'MarkerEdgeColor', featureColours(:,4)', 'MarkerSize', 10);hold on
%     %set(Screen_Display_Axis(7), 'YData', [stimPos_y(4)], 'MarkerFaceColor', featureColours(:,4)', 'MarkerEdgeColor', featureColours(:,4)', 'MarkerSize', 10);hold on
% else
%     
% end
% 



set(Gain_Applied_Axis, 'YData', c_prefgain_9_105*featureValue'); %input_apref


set(Trial_Imp_Axis, 'YData', output_imp);
set(Motor_Click_Axis, 'YData', output_click);
set(Saccade_Neuron_Axis, 'YData', output_r);
set(Fixation_Neuron_Axis, 'YData', output_x);
set(Gaze_Change_Axis, 'YData', output_g);
set(FB_Det_Axis, 'YData', output_fbButton);
set(FB_Exp_Axis, 'YData', output_fbButtonExp);

set(Trial_Num_Axis,'String', ['Trial = ' num2str(trialNum)])
set(Exp_Time_Axis,'String', ['Experiment time (ms) = ' num2str(round(TETTime))])

%pause(0.02);
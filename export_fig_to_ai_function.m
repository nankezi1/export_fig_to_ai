function [outputArg1,outputArg2] = export_fig_to_ai_function(filename, resolution, fig_handle,axis_handle)
%EXPORT_FIG_TO_AI_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

axes_surfaces=findall(axis_handle,'Type','Surface');
axes_lines=findall(axis_handle,'Type','Line');
axes_scatter=findall(axis_handle,'Type','Scatter');
axes_contours=findall(axis_handle,'Type','Contour');
axes_patches=findall(axis_handle,'Type','Patch');
axes_titles=findall(axis_handle,'Type','Text');

current_fig=fig_handle;


% prepare figure for saving
set(axis_handle,'TickDir','out');

xl = xlim;
yl = ylim;
zl = zlim;
set(axis_handle, 'FontName', 'Arial');
% 
% outerpos = get(axis_handle,'OuterPosition');
% ti = get(axis_handle,'TightInset'); 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% set(axis_handle,'Position',[left bottom ax_width ax_height]);


set(current_fig,'Units','centimeters');
pos = get(current_fig,'Position');
set(current_fig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])


% set(axis_handle,'TickLabelInterpreter', 'latex')

set(axis_handle, 'Color', 'None');
set(axis_handle,'Box','off');

% save .png
set(axes_lines,'Visible','off');
set(axes_contours,'Visible','off');
set(axes_scatter,'Visible','off');
set(axes_titles,'Visible','off');

xlim(xl);
ylim(yl);
zlim(zl);

print(current_fig,['-r' resolution],filename,'-dpng');

% save .eps
set(fig_handle, 'Color', 'None')
set(axes_lines,'Visible','on');
set(axes_contours,'Visible','on');
set(axes_scatter,'Visible','on');
set(axes_titles,'Visible','on');
set(axes_surfaces,'Visible','off');
set(axes_patches,'Visible','off');

% export_fig filename '-pdf' -transparent
print(current_fig,['-r' resolution],filename,'-dpdf');

% switch all visibility back on
set(axes_surfaces,'Visible','on');
set(axes_patches,'Visible','on');
set(fig_handle, 'Color', 'white')
end


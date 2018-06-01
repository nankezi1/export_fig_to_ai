function varargout = export_fig_to_ai(varargin)
% EXPORT_FIG_TO_AI MATLAB code for export_fig_to_ai.fig
%      EXPORT_FIG_TO_AI, by itself, creates a new EXPORT_FIG_TO_AI or raises the existing
%      singleton*.
%
%      H = EXPORT_FIG_TO_AI returns the handle to a new EXPORT_FIG_TO_AI or the handle to
%      the existing singleton*.
%
%      EXPORT_FIG_TO_AI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPORT_FIG_TO_AI.M with the given input arguments.
%
%      EXPORT_FIG_TO_AI('Property','Value',...) creates a new EXPORT_FIG_TO_AI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before export_fig_to_ai_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to export_fig_to_ai_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help export_fig_to_ai

% Last Modified by GUIDE v2.5 11-Nov-2017 17:08:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @export_fig_to_ai_OpeningFcn, ...
                   'gui_OutputFcn',  @export_fig_to_ai_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before export_fig_to_ai is made visible.
function export_fig_to_ai_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to export_fig_to_ai (see VARARGIN)

% Choose default command line output for export_fig_to_ai
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes export_fig_to_ai wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = export_fig_to_ai_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_filename_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filename as text
%        str2double(get(hObject,'String')) returns contents of edit_filename as a double


% --- Executes during object creation, after setting all properties.
function edit_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename=get(handles.edit_filename,'String');
resolution=get(handles.edit_resolution,'String');

axes_surfaces=findall(gca,'Type','Surface');
axes_lines=findall(gca,'Type','Line');
axes_scatter=findall(gca,'Type','Scatter');
axes_contours=findall(gca,'Type','Contour');
axes_patches=findall(gca,'Type','Patch');
axes_titles=findall(gca,'Type','Text');

current_fig=gcf;


% prepare figure for saving
set(gca,'TickDir','out');

xl = xlim;
yl = ylim;
zl = zlim;
set(gca, 'FontName', 'Arial');
% 
% outerpos = get(gca,'OuterPosition');
% ti = get(gca,'TightInset'); 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% set(gca,'Position',[left bottom ax_width ax_height]);


set(current_fig,'Units','centimeters');
pos = get(current_fig,'Position');
set(current_fig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])


% set(gca,'TickLabelInterpreter', 'latex')

set(gca, 'Color', 'None');
set(gca,'Box','off');

% save .png
set(axes_lines,'Visible','off');
set(axes_contours,'Visible','off');
set(axes_scatter,'Visible','off');
set(axes_titles,'Visible','off');

xlim(xl);
ylim(yl);
zlim(zl);

print(current_fig,['-r' resolution],filename,'-dtiff');

% save .eps
set(gcf, 'Color', 'None')
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
set(gcf, 'Color', 'white')



function edit_resolution_Callback(hObject, eventdata, handles)
% hObject    handle to edit_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_resolution as text
%        str2double(get(hObject,'String')) returns contents of edit_resolution as a double


% --- Executes during object creation, after setting all properties.
function edit_resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

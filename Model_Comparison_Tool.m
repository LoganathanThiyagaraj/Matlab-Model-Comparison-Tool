function varargout = Model_Comparison_Tool(varargin)
% MODEL_COMPARISON_TOOL MATLAB code for Model_Comparison_Tool.fig
%      MODEL_COMPARISON_TOOL, by itself, creates a new MODEL_COMPARISON_TOOL or raises the existing
%      singleton*.
%
%      H = MODEL_COMPARISON_TOOL returns the handle to a new MODEL_COMPARISON_TOOL or the handle to
%      the existing singleton*.
%
%      MODEL_COMPARISON_TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODEL_COMPARISON_TOOL.M with the given input arguments.
%
%      MODEL_COMPARISON_TOOL('Property','Value',...) creates a new MODEL_COMPARISON_TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Model_Comparison_Tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Model_Comparison_Tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Model_Comparison_Tool

% Last Modified by GUIDE v2.5 05-Sep-2019 12:28:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Model_Comparison_Tool_OpeningFcn, ...
                   'gui_OutputFcn',  @Model_Comparison_Tool_OutputFcn, ...
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


% --- Executes just before Model_Comparison_Tool is made visible.
function Model_Comparison_Tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Model_Comparison_Tool (see VARARGIN)
axes(handles.axes1);
 matlabImage = imread('Nissan_Logo.png');
image(matlabImage)
axis off
 axis image

 axes(handles.axes2);
% axes(axisHandle)
matlabImage = imread('TCS_Logo.png');
image(matlabImage)
axis off
 axis image
 fgfhj=handles.figure1;
  pos1=[117,13,200,373];
  root1 = uitreenode('v0','Root','Root1', [],false);
  mtree1 = uitree('v0','Parent',fgfhj,'Root',root1,'Position',pos1);
  
   pos2=[399 13 191 373];
   root = uitreenode('v0','Root','Root', [],false);
  mtree2 = uitree('v0','Parent',fgfhj,'Root' ,root,'Position',pos2);
 
 set(handles.Browse_Second_Model,'Enable','Off');
    set(handles.Compare_Block_Parameters  ,'Enable','Off');
set(handles.Compare_Configuration_Parameters,'Enable','Off');
% set(handles.Clear_Button,'Enable','Off');
set(handles.Open_Report_Of_BlockParameter_Comparision,'Enable','Off');
set(handles.Open_Report_Of_Configuration_Parameters,'Enable','Off');
% Choose default command line output for Model_Comparison_Tool
% fgh=handles;
handles.output = hObject;
% h=findobj('Tag','listbox3');
% input =  get(h);
% global root 
% root= uitreenode('v0', 'Solver', 'Solver', [],false);
% global pos1
% pos1=[117,13,200,373];
% pos2=[399 13 191 373];
% global mtree1
% mtree1 = uitree('v0', 'Root', root,'Position',pos1);
% 
% mtree2 = uitree('v0', 'Root', root,'Position',pos2);
%position_listbox3=input.Position;
% Update handles structure

guidata(hObject, handles);

% UIWAIT makes Model_Comparison_Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Model_Comparison_Tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse_First_Model.
function Browse_First_Model_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_First_Model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

global name1;
global model_name_1;
global aa;
global str;
global mtree1;
global root;
global pos1;

% node1 = uitreenode('v0', 'Node1', 'Node1', [], false);
% node1.add(uitreenode('v0', 'subnode1',  'Subnode1',  [], true));
% node1.add(uitreenode('v0', 'Subnode2',  'Subnode2',   [], true));
% 
% 
% node2 = uitreenode('v0', 'Node2', 'Node2', [], false);
% node_21=uitreenode('v0', 'Sub', 'Subn', [], false);
% node_22=uitreenode('v0', 'Sub1', 'Subn1', [], true);
% node_21.add(node_22);
% node2.add(node_21);
% node2.add(uitreenode('v0', 'Subnode4', 'Subnode4', [], false));

% Root node
%  root = uitreenode('v0', 'Nodes', 'Nodes', [],false);
%  root.add(node1);
%  root.add(node2);
%  
% % Tree
% pos1=[117,13,200,373];
% mtree1 = uitree('v0', 'Root', root,'Position',pos1);
% % expand('v0',mtree1,'all');
% ab=get(mtree1);


[name1,path1]=uigetfile('*.slx','Select your Model');
% text_Box_Handle=handles.First_Model_name_textbox;
 
 
load_system(name1);
model_name_1=strrep(name1,'.slx','');
aa=find_system(model_name_1,'LookUnderMasks','all');
% Simulink.BlockDiagram.saveActiveConfigSet(model_name_1, [model_name_1 '.m']);
% str = fileread([model_name_1 '.m']);
set(handles.First_Model_name_textbox,'String',name1);
set(handles.Browse_Second_Model,'Enable','On');
% set(handles.Clear_Button,'Enable','On');
set(handles.Browse_First_Model,'Enable','Off');


% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Browse_Second_Model.
function Browse_Second_Model_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Second_Model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global name2;
global name1;
global model_name_2;
global bb;
%  global str_2;
 [name2,path2]=uigetfile('*.slx','Select your Model');
%  text_Box_Handle=handles.Second_Model_name_textbox;
if(strcmp(char(name1),char(name2)))
    f = msgbox('You have selected the Same model  Please select second model again');
%     set(handles.First_Model_name_textbox,'String','');
    set(handles.Browse_First_Model,'Enable','Off');
    set(handles.Browse_Second_Model,'Enable','On');
    set(handles.Clear_Button,'Enable','Off');
else
 load_system(name2);
model_name_2=strrep(name2,'.slx','');
bb=find_system(model_name_2,'LookUnderMasks','all');
%   Simulink.BlockDiagram.saveActiveConfigSet(model_name_2, [model_name_2 '.m']);
% str_2 = fileread([model_name_2 '.m']);
 set(handles.Second_Model_name_textbox,'String',name2);
%  set(handles.Clear_Button,'Enable','Off');
  set(handles.Compare_Configuration_Parameters,'Enable','On');
  set(handles.Browse_Second_Model,'Enable','Off');
   set(handles.Compare_Block_Parameters,'Enable','Off');
  
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Compare_Block_Parameters.
function Compare_Block_Parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_Block_Parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to Compare_Block_Parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global model_name_2;
global model_name_1;
system('taskkill /F /IM EXCEL.EXE')
 delete Block_Parameter_Comparison.xlsx
 delete Block_Parameter_Difference.xlsx
set(handles.Compare_Block_Parameters,'Enable','Off');
global aa;
global bb;

h = waitbar(0,'Block by level Extarction is in Progress');
% set(handles.listbox1,'String',aa);
a_length=length(aa);
b_length=length(bb);
if a_length>b_length
    max=a_length;
else
    max=b_length;
end
list_of_subsystems_a={0}; %Contains list of subsystems in Model 1
list_of_subsystems_b={0}; %Contains list of sussystems in Model 2
for i=1:max; %Loop to extract list of susystems from Model 1 and Model 2
    if i<=length(aa)
    str1=aa{i,1}; 
    list_of_subsystems_a{i,1} = regexprep(str1, '\w*[/]*$', ''); %Exracts the strings present before the last occurance of '/' which excludes the blocks in Model 1   
    end         
    if i<=length(bb)
    str2=bb{i,1};  
    list_of_subsystems_b{i,1} = regexprep(str2, '\w*[^/.]*$', '');%Exracts the strings present before the last occurance of '/' which excludes the blocks in Model 2
    end
end  
[list_of_subsystems_a] = unique(list_of_subsystems_a); % Removing duplicate elements in list of Model 1 subsystem 
list_of_subsystems_a=list_of_subsystems_a(2:end); % Excluding the model 1 name(1st index contain model name) which is of no use
[list_of_subsystems_b] = unique(list_of_subsystems_b); % Removing duplicate elements in list of Model 2 subsystem
list_of_subsystems_b=list_of_subsystems_b(2:end);  % Excluding the model 2 name(1st index contain model name) which is of no use

min=0;
if length(list_of_subsystems_a)<length(list_of_subsystems_b)  % Finding minimum number of levels in 2 Models for comparison
    min=length(list_of_subsystems_a);
else
    min=length(list_of_subsystems_b);
end
Blocks_byLevel_a={0}; % To store level wise or subsystem wise blocks of Model 1 in seperate columns
Blocks_byLevel_b={0}; % To store level wise or subsystem wise blocks of Model 2 in seperate columns
for j=1:min;
%----------------------A----------------------------------------------------------------------------
if j<=length(list_of_subsystems_a) %j increments through common mininum no of levels in 2 Models 
Blocks_byLevel_aa={0};
for i=2:max;  
if i<=length(aa)
str1=aa{i,1}; 
 A = length(find(str1=='/')); % Finds the occurance of '/' which is considered as levels
if A==j  % equates occurance of '/' in a str1 with level deciding vaiable j 
  Blocks_byLevel_aa{i-1,1} = aa{i,1};
end
end
end

Blocks_byLevel_aa(cellfun('isempty',Blocks_byLevel_aa)) = [] ;% remove empty cells from Blocks_byLevel_aa
if(j>1) %This condition is to remove the occurance of value 0 in the 1st index from level 2 onwards 
   Blocks_byLevel_aa=Blocks_byLevel_aa(2:end);
end

Blocks_byLevel_a(1:length(Blocks_byLevel_aa),j)= Blocks_byLevel_aa; %Appends each level blocks of Model 1 in columns wise  
end
%-----------------------A------------------------------------------------------------------------------

%-----------------------B------------------------------------------------------------------------------
if j<=length(list_of_subsystems_b)
Blocks_byLevel_bb={0};
for i=2:max;  
if i<=length(bb)
str2=bb{i,1}; % 
 A = length(find(str2=='/'));
if A==j % equates occurance of '/' in a str2 with level deciding vaiable j 
Blocks_byLevel_bb{i-1,1} = bb{i,1};  
end
end
end
Blocks_byLevel_bb(cellfun('isempty',Blocks_byLevel_bb)) = [] ;% remove empty cells from Blocks_byLevel_bb
if(j>1) % This condition is to remove the occurance of value 0 in the 1st index from level 2 onwards 
   Blocks_byLevel_bb=Blocks_byLevel_bb(2:end);
end
Blocks_byLevel_b(1:length(Blocks_byLevel_bb),j)= Blocks_byLevel_bb; %Appends each level blocks of Model 2 in columns wise
end
%-----------------------B------------------------------------------------------------------------------
%Blocks_byLevel_a -> Contains subsystem wise blocks of Model 1
%Blocks_byLevel_b -> Contains subsystem wise blocks of Model 2
Blocks_byLevel_a(:, all(cellfun(@isempty, Blocks_byLevel_a), 1)) = [];
Blocks_byLevel_b(:, all(cellfun(@isempty, Blocks_byLevel_b), 1)) = [];
end



%xlswrite('Block_levels_A',Blocks_byLevel_a);
%xlswrite('Block_levels_B',Blocks_byLevel_b);

close(h);
h = waitbar(.25,'Comparison is in progress');

% %script for comparision start model1 to model2
[m,n] = size(Blocks_byLevel_a);
[m1,n1] = size(Blocks_byLevel_b);
global name1;
global name2;
model1_name=strrep(char(name1),'.slx','/');
model2_name=strrep(char(name2),'.slx','/');
% no_of_Level=n;
match_not_found=0;
for level=1:n
  A_Diff{1,(2*level)-1}=strcat('Level_',num2str(level),'_Blocks');
   A_Diff{1,2*level}=strcat('Level_',num2str(level),'_Property');
  A_Missing{1,(2*level)-1}=strcat('Level_',num2str(level),'_Blocks');
      A_Missing{1,2*level}=strcat('Level_',num2str(level),'_Block_Type');
    ij=2;
j=2;
ii=1;
for jk=1:m
    match_found=0;
    first_model_block=strrep(char(Blocks_byLevel_a{jk,level}),char(model1_name),'');
    % Adding block name in the List
    if(~isempty(Blocks_byLevel_a{jk,level}))
    str = get(handles.listbox1, 'string'); 
        str = cellstr(str); 
        Block_name=strrep(char(Blocks_byLevel_a{jk,level}),char(model1_name),'');
        str{end+1} = char(Block_name);
        set(handles.listbox1,'String',str);
    end
    for hj=1:m1
      second_model_block=strrep(char(Blocks_byLevel_b{hj,level}),char(model2_name),'');  
    if(strcmp(char(first_model_block),char(second_model_block))&&~(isempty(char(Blocks_byLevel_a{jk,level})))&&~(isempty(char(Blocks_byLevel_b{hj,level}))))
    match_found=5;

first_model_handle=get_param(char(Blocks_byLevel_a{jk,level}),'Handle');
second_model_Handel=get_param(char(Blocks_byLevel_b{hj,level}),'Handle');
first_model_param=get(first_model_handle);
second_model_param=get(second_model_Handel);
first_prop_name=fieldnames(first_model_param);
second_prop_name=fieldnames(second_model_param);
counter=0;
if(length(first_prop_name)==length(second_prop_name))
Diff_Found_flag=0;
for jj=1:length(first_prop_name)
dfg=strcat('first_model_param.',char(first_prop_name(jj)));
val=dfg;
MyValues_first = getfield(first_model_param,first_prop_name{jj});
MyValues_Second = getfield(second_model_param,second_prop_name{jj});
 if (isempty(MyValues_first)||strcmp(char(first_prop_name(jj)),'Position')||strcmp(char(first_prop_name(jj)),'Parent')||strcmp(char(first_prop_name(jj)),'Handle')||strcmp(char(first_prop_name(jj)),'Path')||isstruct(MyValues_first)||strcmp(char(first_prop_name(jj)),'Capabilities')||strcmp(char(first_prop_name(jj)),'DataLoggingOverride')||strcmp(char(first_prop_name(jj)),'ModelWorkspace')||strcmp(char(first_prop_name(jj)),'Blocks')||strcmp(char(first_prop_name(jj)),'Location')||strcmp(char(first_prop_name(jj)),'Ports')||strcmp(char(first_prop_name(jj)),'OutputSignalNames')||strcmp(char(first_prop_name(jj)),'FontName')||strcmp(char(first_prop_name(jj)),'InputSignalNames')||strcmp(char(first_prop_name(jj)),'ScrollbarOffset')||strcmp(char(first_prop_name(jj)),'BackgroundColor')||strcmp(char(first_prop_name(jj)),'FontSize')||strcmp(char(first_prop_name(jj)),'ZoomFactor')||strcmp(char(first_prop_name(jj)),'TiledPaperMargins')||strcmp(char(first_prop_name(jj)),'PaperSize')||strcmp(char(first_prop_name(jj)),'PaperPosition')||strcmp(char(first_prop_name(jj)),'FontAngle')||strcmp(char(first_prop_name(jj)),'FontWeight')||strcmp(char(first_prop_name(jj)),'Position')||strcmp(char(first_prop_name(jj)),'PortRotationType')||strcmp(char(first_prop_name(jj)),'ForegroundColor')||strcmp(char(first_prop_name(jj)),'ShowName')||strcmp(char(first_prop_name(jj)),'AttributesFormatString')||strcmp(char(first_prop_name(jj)),'PortDimensions')||strcmp(char(first_prop_name(jj)),'PaperUnits')||strcmp(char(first_prop_name(jj)),'PaperType')||strcmp(char(first_prop_name(jj)),'CurrentBlock')||strcmp(char(first_prop_name(jj)),'Open')||strcmp(char(first_prop_name(jj)),'PermitHierarchicalResolution')||strcmp(char(first_prop_name(jj)),'RTWFcnNameOpts')||strcmp(char(first_prop_name(jj)),'DropShadow')||strcmp(char(first_prop_name(jj)),'ModelBrowserVisibility')||strcmp(char(first_prop_name(jj)),'LibraryVersion'))

    counter=counter+1;
 else

     if(strcmp(char(MyValues_first),char(MyValues_Second)))
        
     else
%   if(length(MyValues_first)==length(MyValues_Second))
         fgh=strcat(char(Blocks_byLevel_a{jk,level}),'/property_name/',char(first_prop_name{jj}),',',char(MyValues_first),',',char(MyValues_Second));
          A_Diff11{ii,level}=char(Blocks_byLevel_a{jk,level});
         A_Diff12{ii,level}=char(first_prop_name{jj});

Diff_Found_flag=5;
         ii=ii+1;
         if (level==1)
         A_Diff{j,level}=fgh;
         A_Diff{j,level+1}=char(first_prop_name{jj});
         else
             index=2*level-1;
             A_Diff{j,index}=fgh;
             A_Diff{j,index+1}=char(first_prop_name{jj});
         end
       
         j=j+1;
%          end
     end
 end
end
if(Diff_Found_flag==5)
    str = get(handles.listbox1, 'string'); 
        str = cellstr(str); 
         Block_name=strrep(char(Blocks_byLevel_a{jk,level}),char(model1_name),'');
       
        stghj=strcat('<HTML><BODY bgcolor="aqua">',char(Block_name));
        str{end} = char(stghj);
        set(handles.listbox1,'String',str);
end
else
end
    else
    end
    end

     if(match_found==0)
str = get(handles.listbox1, 'string'); 
        str = cellstr(str);
         Block_name=strrep(char(Blocks_byLevel_a{jk,level}),char(model1_name),'');
        stghj=strcat('<HTML><BODY bgcolor="red">',char(Block_name));
        str{end} = char(stghj);
        set(handles.listbox1,'String',str);
      
         A_Missing{ij,2*level-1}=char(Blocks_byLevel_a{jk,level}); 
           if ~isempty(char(Blocks_byLevel_a{jk,level}))
         model_handle=get_param(char(Blocks_byLevel_a{jk,level}),'Handle');
         model_param=get(model_handle);      
                Block_Type=model_param.BlockType;
          A_Missing{ij,2*level}=char(Block_Type);  
       ij=ij+1;
          end
   
%              %index=2*level-1;
%              A_Missing{ij,2*level-1}=char(Blocks_byLevel_a{jk,level});
%          
%             % Block_Type=first_model_param.BlockType;
%             % A_Missing{ij,index+1}=char(Block_Type);  
%             A_Missing{ij,2*level}=555;  
             
      
   
    match_not_found=match_not_found+1;
     
    end
end
end

A_Missing(all(cellfun(@isempty, A_Missing), 2),:) = [];

xlswrite('Block_Parameter_Comparison.xlsx',A_Diff,'Block_Parameters_Difference');
xlswrite('Block_Parameter_Comparison.xlsx',A_Missing,'Missed_Blocks_In_Model2');


close(h);
h = waitbar(.50,'Comparison is in progress');

%script for model2 to model Comparision
[m_c,n_c] = size(Blocks_byLevel_b);
[m1_c,n1] = size(Blocks_byLevel_a);

model1_name_c=strrep(char(name2),'.slx','/');
model2_name_c=strrep(char(name1),'.slx','/');
% no_of_Level_c=n_c;
match_not_found_c=0;
for level_c=1:n_c

    A_Diff_c{1,(2*level_c)-1}=strcat('Level_',num2str(level_c),'_Blocks');
   A_Diff_c{1,2*level_c}=strcat('Level_',num2str(level_c),'_Property');
  A_Missing_c{1,(2*level_c)-1}=strcat('Level_',num2str(level_c),'_Blocks');
    A_Missing_c{1,2*level_c}=strcat('Level_',num2str(level_c),'_Block_Type');
  
    ij_c=2;
j_c=2;
ii_c=1;
for jk_c=1:m_c
    match_found_c=0;
    first_model_block_c=strrep(char(Blocks_byLevel_b{jk_c,level_c}),char(model1_name_c),'');
    % Adding block name in the List
    if(~isempty(Blocks_byLevel_b{jk_c,level_c}))
    str_c = get(handles.listbox2, 'string'); 
%     ghjkth=get(str_c)char(model1_name_c);
        str_c = cellstr(str_c); 
        Block_name_c=strrep(char(Blocks_byLevel_b{jk_c,level_c}),char(model1_name_c),'');
        str_c{end+1} = char(Block_name_c);
        set(handles.listbox2,'String',str_c);
    end
    for hj_c=1:m1_c
      second_model_block_c=strrep(char(Blocks_byLevel_a{hj_c,level_c}),char(model2_name_c),'');  
%       set(handles.listbox1,'String',char(Blocks_byLevel_a{23,level_c}));
%       set(handles.listbox2,'String',char(Blocks_byLevel_b{23,level_c}));
    if(strcmp(char(first_model_block_c),char(second_model_block_c))&&~(isempty(char(Blocks_byLevel_b{jk_c,level_c})))&&~(isempty(char(Blocks_byLevel_a{hj_c,level_c}))))
    match_found_c=5;

first_model_handle_c=get_param(char(Blocks_byLevel_b{jk_c,level_c}),'Handle');
second_model_Handel_c=get_param(char(Blocks_byLevel_a{hj_c,level_c}),'Handle');
first_model_param_c=get(first_model_handle_c);
second_model_param_c=get(second_model_Handel_c);
first_prop_name_c=fieldnames(first_model_param_c);
second_prop_name_c=fieldnames(second_model_param_c);
counter_c=0;
if(length(first_prop_name_c)==length(second_prop_name_c))
%     comp_c=1
Diff_Found_flag_c=0;

for jj_c=1:length(first_prop_name_c)
dfg_c=strcat('first_model_param_c.',char(first_prop_name_c(jj_c)));
val_c=dfg_c;
MyValues_first_c = getfield(first_model_param_c,first_prop_name_c{jj_c});
MyValues_Second_c = getfield(second_model_param_c,second_prop_name_c{jj_c});
 if (isempty(MyValues_first_c)||strcmp(char(first_prop_name_c(jj_c)),'Position')||strcmp(char(first_prop_name_c(jj_c)),'Parent')||strcmp(char(first_prop_name_c(jj_c)),'Handle')||strcmp(char(first_prop_name_c(jj_c)),'Path')||isstruct(MyValues_first_c)||strcmp(char(first_prop_name_c(jj_c)),'Capabilities')||strcmp(char(first_prop_name_c(jj_c)),'DataLoggingOverride')||strcmp(char(first_prop_name_c(jj_c)),'ModelWorkspace')||strcmp(char(first_prop_name_c(jj_c)),'Blocks')||strcmp(char(first_prop_name_c(jj_c)),'Location')||strcmp(char(first_prop_name_c(jj_c)),'Ports')||strcmp(char(first_prop_name_c(jj_c)),'OutputSignalNames')||strcmp(char(first_prop_name_c(jj_c)),'PaperPosition')||strcmp(char(first_prop_name_c(jj_c)),'InputSignalNames')||strcmp(char(first_prop_name_c(jj_c)),'ScrollbarOffset')||strcmp(char(first_prop_name_c(jj_c)),'BackgroundColor')||strcmp(char(first_prop_name_c(jj_c)),'FontSize')||strcmp(char(first_prop_name_c(jj_c)),'ZoomFactor')||strcmp(char(first_prop_name_c(jj_c)),'TiledPaperMargins')||strcmp(char(first_prop_name_c(jj_c)),'PaperSize')||strcmp(char(first_prop_name_c(jj_c)),'FontName')||strcmp(char(first_prop_name_c(jj_c)),'FontAngle')||strcmp(char(first_prop_name_c(jj_c)),'FontWeight')||strcmp(char(first_prop_name_c(jj_c)),'Position')||strcmp(char(first_prop_name_c(jj_c)),'PortRotationType')||strcmp(char(first_prop_name_c(jj_c)),'ForegroundColor')||strcmp(char(first_prop_name_c(jj_c)),'ShowName')||strcmp(char(first_prop_name_c(jj_c)),'AttributesFormatString')||strcmp(char(first_prop_name_c(jj_c)),'PortDimensions')||strcmp(char(first_prop_name_c(jj_c)),'PaperUnits')||strcmp(char(first_prop_name_c(jj_c)),'PaperType')||strcmp(char(first_prop_name_c(jj_c)),'CurrentBlock')||strcmp(char(first_prop_name_c(jj_c)),'Open')||strcmp(char(first_prop_name_c(jj_c)),'PermitHierarchicalResolution')||strcmp(char(first_prop_name_c(jj_c)),'RTWFcnNameOpts')||strcmp(char(first_prop_name_c(jj_c)),'DropShadow')||strcmp(char(first_prop_name_c(jj_c)),'ModelBrowserVisibility')||strcmp(char(first_prop_name_c(jj_c)),'LibraryVersion'))
%     fprintf('empty prope)rties\n')
    counter_c=counter_c+1;
 else
%      comp1=1
%      comparable_prop{i,1}=char(first_prop_name_c(jj_c));
%      i=i+1;
%      MyValues_first_1_c = getfield(first_model_param_c,first_prop_name_c{jj_c});
%      MyValues_Second_1_c = getfield(second_model_param_c,second_prop_name_c{jj_c});
     if(strcmp(char(MyValues_first_c),char(MyValues_Second_c)))
     else
%          comp3=1;
%          if(length(MyValues_first_c)==length(MyValues_Second_c))
         fgh_c=strcat(char(Blocks_byLevel_b{jk_c,level_c}),'/property_name/',char(first_prop_name_c{jj_c}),',',char(MyValues_first_c),',',char(MyValues_Second_c));
         %level_c=length(find(char(first_model(jk_c))=='/'));
          A_Diff11_c{ii_c,level_c}=char(Blocks_byLevel_b{jk_c,level_c});
         A_Diff12_c{ii_c,level_c}=char(first_prop_name_c{jj_c});
%          A_Diff13_c{ii1,level_c}=char(MyValues_first_1_c);
%          ii1=ii1+1;
%          A_Diff14{ii2,level_c}=char(MyValues_Second_1_c);
%          ii2=ii2+1;
Diff_Found_flag_c=5;
         ii_c=ii_c+1;
       
         
          if (level_c==1)
         A_Diff_c{j_c,level_c}=fgh_c;
         A_Diff_c{j_c,level_c+1}=char(first_prop_name_c{jj_c});
         else
             index=2*level_c-1;
             A_Diff_c{j_c,index}=fgh_c;
             A_Diff_c{j_c,index+1}=char(first_prop_name_c{jj_c});
             
          end
         j_c=j_c+1;
         
%          end
     end
 end
end
if(Diff_Found_flag_c==5)
    str_c = get(handles.listbox2, 'string'); 
        str_c = cellstr(str_c); 
         Block_name_c=strrep(char(Blocks_byLevel_b{jk_c,level_c}),char(model1_name_c),'');
       
        stghj_c=strcat('<HTML><BODY bgcolor="aqua">',char(Block_name_c));
        str_c{end} = char(stghj_c);
        set(handles.listbox2,'String',str_c);
end
else
%     fprintf('Blocks are of different type');
end
else
    
end
    end
    if(match_found_c==0)
%     fprintf('Blocks not Found\n');
str_c = get(handles.listbox2, 'string'); 
        str_c = cellstr(str_c);
         Block_name_c=strrep(char(Blocks_byLevel_b{jk_c,level_c}),char(model1_name_c),'');
        stghj_c=strcat('<HTML><BODY bgcolor="red">',char(Block_name_c));
        str_c{end} = char(stghj_c);
        set(handles.listbox2,'String',str_c);
% str_c = get(handles.listbox1, 'string'); 
%      ghun=get(handles.listbox1);
%         str_c = 'dfgukh'; 
%       stghj_c=strcat('<HTML><BODY bgcolor="red">',char(Blocks_byLevel_a{jk_c,level_c}));
%       set(handles.listbox1,'String',{stghj_c});
 
      A_Missing_c{ij_c,2*level_c-1}=char(Blocks_byLevel_b{jk_c,level_c}); 
         if ~isempty(char(Blocks_byLevel_b{jk_c,level_c}))
              model_handle_c=get_param(char(Blocks_byLevel_b{jk_c,level_c}),'Handle');
         model_param_c=get(model_handle_c);      
                Block_Type=model_param_c.BlockType;
          A_Missing_c{ij_c,2*level_c}=char(Block_Type);  
           ij_c=ij_c+1;
         end

   
    match_not_found_c=match_not_found_c+1;
    
    
    
    end
end
end

A_Missing_c(all(cellfun(@isempty, A_Missing_c), 2),:) = [];
close(h);
h = waitbar(.75,'Report creation is in progress');


% xlswrite('Block_Parameter_Comparison.xls',A_Diff_c,'Diff_Model2_to_Model1');
% xlswrite('Missed1.xls',A_Missing_c,'Missed_Model2_to_Model1');
xlswrite('Block_Parameter_Comparison.xlsx',A_Missing_c,'Missed_Blocks_In_Model1');
close(h);
h = waitbar(.90,'Report creation is in progress');
%  configDialogBox.block_difference_highlighting(A_Diff,A_Diff_c,model_name_1,model_name_2);
% configDialogBox.Model_two_highlighting(A_Missing_c,model_name_2);
 configDialogBox.BlockParameterScreenshot(A_Missing,A_Missing_c,A_Diff,A_Diff_c,model_name_1,model_name_2);
%     configDialogBox.model_two_screenshot(A_Missing_c,model_name_2,model_name_1,'white');
%   configDialogBox.BlockParameterScreenshot(A_Missing_c,model_name_2,model_name_1,'green');
 close(h); 
   h = waitbar(1,'Completed');
     set(handles.Open_Report_Of_BlockParameter_Comparision,'Enable','On');
    close(h);
     


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Compare_Configuration_Parameters.
function Compare_Configuration_Parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_Configuration_Parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Compare_Configuration_Parameters,'Enable','Off');
clc
%  e = actxGetRunningServer('excel.application');
%         w = e.Workbooks;
%    for i=1:w.Count;
%      if strcmp('Configuration_Parameters_Comparison.xlsx',w.Item(i).Name)
%           w.Item('Configuration_Parameters_Comparison.xlsx').Save;
%           w.Item('Configuration_Parameters_Comparison.xlsx').Close;
%           break;
%      end
%    end
system('taskkill /F /IM EXCEL.EXE')
delete Configuration_Parameters_Comparison.xlsx
global name1;
global name2;
global model_name_1;
global model_name_2;
global List_of_Model_1_Parameter_Names;global List_of_Model_2_Parameter_Names;global Indexes_of_Additional_Parameter_Model_1;global List_of_Model_2_Parameter_Values;global List_of_Model_1_Parameter_Values;global Indexes_of_Additional_Parameter_Model_2;global value_1;global value_2;
h = waitbar(0,'Extracting Parameters from Model_1 & Model_2');

Simulink.BlockDiagram.saveActiveConfigSet(model_name_1, [model_name_1 '.m']);
str = fileread([model_name_1 '.m']);

Parameters=strsplit(str, {'cs.set_param(', ',*);%'});
for i = 2:length(Parameters)
    Temp=Parameters{1,i};
    parameter = regexprep(Temp,').*','');
    Parameters{1,i}=parameter;
end

Parameters=Parameters(2:end);
[~,noMatch] = regexp(Parameters,',','match','split');
for i=1:length(noMatch) 
List_of_Model_1_Parameter_Names{i}=noMatch{1,i}{1};
List_of_Model_1_Parameter_Values{i}=noMatch{1,i}{2};
end

List_of_Model_1_Parameter_Names=strrep(List_of_Model_1_Parameter_Names(1:end),char(39),'');
List_of_Model_1_Parameter_Values=strrep(List_of_Model_1_Parameter_Values(1:end),char(39),'');

Simulink.BlockDiagram.saveActiveConfigSet(model_name_2, [model_name_2 '.m']);
str_2 = fileread([model_name_2 '.m']);
Parameters_2=strsplit(str_2, {'cs.set_param(', ',*);%'});
for i = 2:length(Parameters_2)
    Temp_2=Parameters_2{1,i};
    parameter_2 = regexprep(Temp_2,').*','');
    Parameters_2{1,i}=parameter_2;
end

Parameters_2=Parameters_2(2:end);
[~,noMatch_2] = regexp(Parameters_2,',','match','split');
for i=1:length(noMatch_2) 
List_of_Model_2_Parameter_Names{i}=noMatch_2{1,i}{1};
List_of_Model_2_Parameter_Values{i}=noMatch_2{1,i}{2};
end

List_of_Model_2_Parameter_Names=strrep(List_of_Model_2_Parameter_Names(1:end),char(39),'');
List_of_Model_2_Parameter_Values=strrep(List_of_Model_2_Parameter_Values(1:end),char(39),'');
  close(h)
 h=waitbar(.25,'Comparing Model_1 & Model_2 Parameter Values');

% Compare 2 configuration parameters

% Initialization and definition of variables for Model parameter names
[name_diff_1,name_diff_index_1]=setdiff(List_of_Model_1_Parameter_Names,List_of_Model_2_Parameter_Names);
s1 = size(name_diff_index_1);
S1 = s1(1)*s1(2);
V1 = reshape(name_diff_index_1,1,S1);
Indexes_of_Additional_Parameter_Model_1 = num2cell(V1,1);
[name_diff_2,name_diff_index_2]=setdiff(List_of_Model_2_Parameter_Names,List_of_Model_1_Parameter_Names);
s2 = size(name_diff_index_2);
S2 = s2(1)*s2(2);
V2 = reshape(name_diff_index_2,1,S2);
Indexes_of_Additional_Parameter_Model_2 = num2cell(V2,1);

% Initialization and definition of variables for Model parameter values

Difference_in_Values={};
m=2;
for i=1:length(List_of_Model_1_Parameter_Names);

       for j=1:length(List_of_Model_2_Parameter_Names)
           b=strcmp(char(List_of_Model_1_Parameter_Names{i}),char(List_of_Model_2_Parameter_Names{j}));
           if b==1
               c=strcmp(char(List_of_Model_1_Parameter_Values{i}),char(List_of_Model_2_Parameter_Values{j}));
               if c==0
                   NewColor1 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Aqua', List_of_Model_1_Parameter_Names{i});
                   NewColor2 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Aqua', List_of_Model_2_Parameter_Names{j});                
  Difference_in_Values{m,1}=List_of_Model_1_Parameter_Names{i};
                   List_of_Model_1_Parameter_Names{i}=NewColor1;
                   List_of_Model_2_Parameter_Names{j}=NewColor2;
                   NewColor1 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Aqua', List_of_Model_1_Parameter_Values{i});
                   NewColor2 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Aqua', List_of_Model_2_Parameter_Values{j});
  Difference_in_Values{m,2}=List_of_Model_1_Parameter_Values{i};
  Difference_in_Values{m,3}=List_of_Model_2_Parameter_Values{j};
                   List_of_Model_1_Parameter_Values{i}=NewColor1;              
                   List_of_Model_2_Parameter_Values{j}=NewColor2;              
                    m=m+1;
                    break;
               end
           else
               continue;
           end
       end
end
 close(h)
 h= waitbar(.50,'Comparing configuration Names');

Additional_Parameters={};
m=2;
for j=1:length(Indexes_of_Additional_Parameter_Model_1)    
  Additional_Parameters{m,1}=List_of_Model_1_Parameter_Names{Indexes_of_Additional_Parameter_Model_1{j}};
  Additional_Parameters{m,2}=List_of_Model_1_Parameter_Values{Indexes_of_Additional_Parameter_Model_1{j}};
         m=m+1;
          NewColor1 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Red', List_of_Model_1_Parameter_Names{Indexes_of_Additional_Parameter_Model_1{j}});
          List_of_Model_1_Parameter_Names{Indexes_of_Additional_Parameter_Model_1{j}}=NewColor1;
 end
m=2;
for j=1:length(Indexes_of_Additional_Parameter_Model_2)
  Additional_Parameters{m,3}=List_of_Model_2_Parameter_Names{Indexes_of_Additional_Parameter_Model_2{j}};
  Additional_Parameters{m,4}=List_of_Model_2_Parameter_Values{Indexes_of_Additional_Parameter_Model_2{j}};
          m=m+1;
         NewColor1 = sprintf('<HTML><BODY bgcolor="%s">%s', 'Red', List_of_Model_2_Parameter_Names{Indexes_of_Additional_Parameter_Model_2{j}});
          List_of_Model_2_Parameter_Names{Indexes_of_Additional_Parameter_Model_2{j}}=NewColor1;
end
% set(handles.listbox3,'String',List_of_Model_1_Parameter_Names)
% set(handles.listbox4,'String',List_of_Model_2_Parameter_Names)
 


 close(h)
 h= waitbar(.75,'Generating Report');
 Difference_in_Values{1,1}=  'Parameter_Name' ;
 Difference_in_Values{1,2}=  'Model_1_Parameter_Value' ;
 Difference_in_Values{1,3}= 'Model_2_Parameter_Value' ;
 Additional_Parameters{1,1}= 'Parameter_Name' ;
 Additional_Parameters{1,2}='Model_1_Parameter_Value' ;
 Additional_Parameters{1,3}= 'Parameter_Name' ;
 Additional_Parameters{1,4}= 'Model_2_Parameter_Value' ;

 
 data1 = {'Difference_in_Values'};
   xlswrite('Configuration_Parameters_Comparison.xlsx',data1,'Sheet1','A1');
   data1 = {'Additional_Parameters'};
   xlswrite('Configuration_Parameters_Comparison.xlsx',data1,'Sheet2','A1');
xlswrite('Configuration_Parameters_Comparison.xlsx',Difference_in_Values,'Sheet1','A2');
NoOfRows1=length(Difference_in_Values);
xlswrite('Configuration_Parameters_Comparison.xlsx',Additional_Parameters,'Sheet2','A2');
 NoOfRows2= length(Additional_Parameters);
 
% xlswrite('Configuration_Parameters_Comparison.xlsx',Difference_in_Values,'Difference_in_Values','A1');
% NoOfRows1=length(Difference_in_Values);
% xlswrite('Configuration_Parameters_Comparison.xlsx',Additional_Parameters,'Additional_Parameters','A1');
% NoOfRows2= length(Additional_Parameters);

fid=fopen([model_name_1 '.m']);
res1={};
while ~feof(fid)
  res1{end+1,1} =fgetl(fid);
end

for i=1:length(res1)
 flag1=strfind(char(res1{i,1}),'cs.set_param');
 if flag1==1
     break;
 end
end

for j=1:i-2
 res1(1)=[];
end
p=1;
Total=length(res1);
t=1;
 x=1;
 node1={};
while p<=Total
   node={};
   dfg=char(res1(p));
   dfg1=dfg(1:2);
      if strcmp(char(dfg1),'% ')==1
          com= strsplit(char(dfg),'%');
          p=p+1;
          node_name1{t}=char(com(2));
          t=t+1;
          m=1;
          Tf=0;
         while Tf==0
            str1 = strsplit(char(res1(p)),'''');
            node{m}= str1(2);    
            p=p+1;
            m=m+1;
            if p>=Total
                break;
            end
            empty_line=char(res1(p));
            Tf=(strcmp(empty_line,' ')||isempty(empty_line));
         end
         node1=[node1 node];
         count{x}=m-1;
         x=x+1;
      end
       p=p+1;
end
k=1;
root1 = uitreenode('v0','Root','Root1', [],false);
for i=1:length(node_name1)
    if i==1
        node_name1{i}='General properties';
    end
    var_name = uitreenode('v0',char(node_name1{i}) , char(node_name1{i}), [],false);
    for j=k:k+count{i}-1
        flag=0;
        flag2=0;
        A=uitreenode('v0',char(node1{j}) , char(node1{j}), [], true);
        for a=2:NoOfRows1
            if strcmp(char(Difference_in_Values(a)),char(node1{1,j}))
              A.setName(['<html><BODY bgcolor="aqua">' char(node1{j})]);
              flag=1;
            end
        end
        for a=2:NoOfRows2
            if strcmp(char(Additional_Parameters(a)),char(node1{1,j}))
              A.setName(['<html><BODY bgcolor="red">' char(node1{j})]);
              flag2=1;
            end
        end
        if flag==1
            var_name.setName(['<html><BODY bgcolor="aqua">' char(node_name1{i})]);
        end
        if flag2==1
            var_name.setName(['<html><BODY bgcolor="red">' char(node_name1{i})]);
        end
        if flag==1 && flag2==1
            var_name.setName(['<html><BODY bgcolor="red">' char(node_name1{i})]);
        end
        var_name.add(A);
    end
    root1.add(var_name);
    k=j+1;
end
  pos1=[117,13,200,373];
  fgfhj=handles.figure1;
  mtree1 = uitree('v0','Parent',fgfhj,'Root',root1,'Position',pos1);
  mtree1.expand(root1);
  
  
fid=fopen([model_name_2 '.m']);
res2={};
while ~feof(fid)
  res2{end+1,1} =fgetl(fid);
end

for i=1:length(res2)
 flag2=strfind(char(res2{i,1}),'cs.set_param');
 if flag2==1
     break;
 end
end

for j=1:i-2
 res2(1)=[];
end
p=1;
Total=length(res2);
t=1;
 x=1;
 node2={};
while p<=Total
   node={};
   dfg=char(res2(p));
   dfg1=dfg(1:2);
      if strcmp(char(dfg1),'% ')==1
          com= strsplit(char(dfg),'%');
          p=p+1;
          node_name2{t}=char(com(2));
          t=t+1; 
          m=1;
          Tf=0;
         while Tf==0
            str1 = strsplit(char(res2(p)),'''');
            node{m}= str1(2);    
            p=p+1;
            m=m+1;
            if p>=Total
                break;
            end
             empty_line=char(res2(p));
            Tf=(strcmp(empty_line,' ')||isempty(empty_line));
%             Tf=isempty(char(res2(p)));
         end
         node2=[node2 node];
         count{x}=m-1;
         x=x+1;
      end
       p=p+1;
end
k=1;
root = uitreenode('v0','Root','Root', [],false);
for i=1:length(node_name2)
    if i==1
        node_name2{i}='General properties';
    end
    var_name = uitreenode('v0',char(node_name2{i}) , char(node_name2{i}), [],false);
    for j=k:k+count{i}-1
        flag=0;
        flag2=0;
        A=uitreenode('v0',char(node2{j}) , char(node2{j}), [], true);
        for a=2:NoOfRows1
            if strcmp(char(Difference_in_Values(a)),char(node2{1,j}))
              A.setName(['<html><BODY bgcolor="aqua">' char(node2{j})]);
              flag=1;
            end
        end
        for a=2:NoOfRows2
            if strcmp(char(Additional_Parameters(a)),char(node2{1,j}))
              A.setName(['<html><BODY bgcolor="red">' char(node2{j})]);
              flag2=1;
            end
        end
        if flag==1
            var_name.setName(['<html><BODY bgcolor="aqua">' char(node_name2{i})]);
        end
        if flag2==1
            var_name.setName(['<html><BODY bgcolor="red">' char(node_name1{i})]);
        end
        if flag==1 && flag2==1
            var_name.setName(['<html><BODY bgcolor="red">' char(node_name1{i})]);
        end
        var_name.add(A);
    end
    root.add(var_name);
    k=j+1;
end
  pos2=[399 13 191 373];
  mtree2 = uitree('v0','Parent',fgfhj,'Root' ,root,'Position',pos2);
  mtree2.expand(root);


   close(h)
   h= waitbar(.90,'Generating Report');
 set(handles.Open_Report_Of_Configuration_Parameters,'Enable','On'); 
 set(handles.Compare_Block_Parameters,'Enable','On');
  configDialogBox.selectmodel(name1,name2)
  configDialogBox.CreateLinkonValues(Additional_Parameters,2)
 configDialogBox.CreateLinkonValues(Additional_Parameters,3)
 configDialogBox.CreateLinkonValues(Difference_in_Values,1)
 close(h)
 h= waitbar(1,'Completed');
close(h)


% --- Executes on button press in pushbutton6.
% function pushbutton6_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clear_Button.
% function Clear_Button_Callback(hObject, eventdata, handles)
% % hObject    handle to Clear_Button (see GCBO)
% 
% % eventdata  reserved - to be defined in a future version f MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% set(handles.First_Model_name_textbox,'String','');
% set(handles.Browse_First_Model,'Enable','On');
% set(handles.Browse_Second_Model,'Enable','Off');
% set(handles.Clear_Button,'Enable','Off');


% --- Executes on button press in Open_Report_Of_Configuration_Parameters.
function Open_Report_Of_Configuration_Parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Open_Report_Of_Configuration_Parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('Configuration_Parameters_Comparison.xlsx')


% --- Executes on button press in Open_Report_Of_BlockParameter_Comparision.
function Open_Report_Of_BlockParameter_Comparision_Callback(hObject, eventdata, handles)
% hObject    handle to Open_Report_Of_BlockParameter_Comparision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('Block_Parameter_Comparison.xlsx')
winopen('Block_Parameter_Difference.xlsx')



% --- Executes on key press with focus on listbox3 and none of its controls.
function listbox3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

function boxCallback(clicked,~)
  clicked.Visible='on';
  clicked.FaceColor = evalin('base','color');
%   assignin('base','count',count+1)
  color = evalin('base','color');
  if evalin('base','count')==10
      errordlg('You have reached your limit for this selection! Please choose a different option for placement.')
  end
  switch color
      case 'r'
          assignin('base','countR',evalin('base','countR')+1)
          assignin('base','count',evalin('base','count')+1);
      case 'b'
          assignin('base','countB',evalin('base','countB')+1);
          assignin('base','count',evalin('base','count')+1)
      case 'm'
          assignin('base','countM',evalin('base','countM')+1);
          assignin('base','count',evalin('base','count')+1)
      case [0.1 0.7 1]
          
          
  end
end
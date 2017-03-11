function boxCallback(clicked,~)
  clicked.Visible='on';
  clicked.FaceColor = evalin('base','color');
%   assignin('base','count',count+1)
  color = evalin('base','color');
  switch color
      case 'r'
          assignin('base','countR',evalin('base','countR')+1);
      case 'b'
          assignin('base','countB',evalin('base','countB')+1);
      case 'm'
          assignin('base','countM',evalin('base','countM')+1);
      case [0.1 0.7 1]
          
  end
end
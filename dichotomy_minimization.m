function dichotomy_minimization
  
  f = str2func(strcat('@(x) ', input('- Objective function handle: @(x) ', 's')));  % ��������� � ���������� ����� ������� �������  
	left  = input('- Left end of the segment:  ');  % ����� ����� �������� �����������
	right = input('- Right end of the segment: ');  % ������ ����� �������� �����������
	epsilon = input('- Desired precision:  ');  % ��������� ��������
  
  alpha = 0.001;	% ��������� ������������	
  n = 50;         % ���������� ��������� �����
  
  k = 0; 	      % �������������� ������� ��������
	l = 0; 	      % �������������� ������� ���������� �������
  x_temp = [];  % �������������� ������ ������������ �������� ��������
  dx = left : (right - left)/n : right; % ���������� �����
  
	% ���� ����� �������� ����������� ������ ��������� ��������
	while (right - left > 2 * epsilon)
		
		% ��������� ������������ ����� ����� �������� �����������
		left_new  = (left + right) / 2 - alpha;
		right_new = (left + right) / 2 + alpha;
		
		% ��������� �������� ������� � ���� ������
		f_left_new  = f(left_new);
		f_right_new = f(right_new);
		l += 2;	% �������������� ������� ���������� �������
		
		% ���������� ����� ������ �������� �����������
		if (f_left_new > f_right_new)
			left = left_new;
		else
			right = right_new;
		end
    
    % ��������� � ������ ����������� ������� ����� ��������
    x_temp = [x_temp; (left + right) / 2];
    
		k += 1;	% �������������� ������� ��������
    
	end
	  
	x_final = x_temp(end);	% ���������� ��������� ��������� ����������� ����� ��������
  x_temp(end) = [];       % ������� ��� �� ������� �����������, ����� �� ������������ ������
	
  % ������ ������
  figure('Name','Dichotomy minimization method','NumberTitle','off'), 
  plot(dx, f(dx), '-b', x_final, f(x_final), 'ro', x_temp, f(x_temp), 'kx');
  legend('Objective function', 'Final minimum point', 'Intermediate minimum points');
  
  % ��������� ����� � ��������������� ������������ �������� � �������� ��������, �� ������� ��� ���� ��������
  for i = 1 : length(x_temp)
    text(x_temp(i), f(x_temp(i)), sprintf('%d', i), 'VerticalAlignment','top','HorizontalAlignment','left');
  end
  
	% ������� ���������� � �������
	printf("Minimum:       \t%d\nFunction value:\t%d\nIterations:    \t%d\nCalls:         \t%d\n", x_final, f(x_final), k, l);
	
end
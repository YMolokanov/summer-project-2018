function dichotomy_minimization
  
  f = str2func(strcat('@(x) ', input('- Objective function handle: @(x) ', 's')));  % ��������� � ���������� ����� ������� �������  
	left  = input('- Left end of the segment:  ');  % ����� ����� �������� �����������
	right = input('- Right end of the segment: ');  % ������ ����� �������� �����������
	epsilon = input('- Desired precision:  ');  % ��������� ��������
  
  alpha = 0.001;	% ��������� ������������	
  
  k = 0;	% �������������� ������� ��������
	l = 0;	% �������������� ������� ���������� �������
  
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
    
		k += 1;	% �������������� ������� ��������
    
	end
	
  % ��������� ����� ��������
	x = (left + right) / 2;	
	
	% ������� ���������� � �������
	printf("Minimum:       \t%d\nFunction value:\t%d\nIterations:    \t%d\nCalls:         \t%d\n", x, f(x), k, l);
	
end
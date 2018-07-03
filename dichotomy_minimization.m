function dichotomy_minimization
  
	left = 0.5;		  % ����� ����� �������� �����������
	right = 1;		  % ������ ����� �������� �����������
	alpha = 0.001;	% ��������� ������������
	epsilon = 0.01;	% ��������� ��������
  
  k = 0;	% �������������� ������� ��������
	l = 0;	% �������������� ������� ���������� �������
  
	% ���� ����� �������� ����������� ������ ��������� ��������
	while (right - left > epsilon)
		
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



% ������� �������
function y = f(x)
  
	y = x.^2 + 3.*x.*(log(x) .- 1);
  
end
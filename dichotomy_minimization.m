function dichotomy_minimization
  
  f = str2func(strcat('@(x) ', input('- Objective function handle: @(x) ', 's')));  % Считываем и генерируем хэндл целевой функции  
	left  = input('- Left end of the segment:  ');  % Левый конец сегмента локализации
	right = input('- Right end of the segment: ');  % Правый конец сегмента локализации
	epsilon = input('- Desired precision:  ');  % Требуемая точность
  
  alpha = 0.001;	% Константа различимости	
  n = 50;         % Количество сегментов сетки
  
  k = 0; 	      % Инициализируем счетчик итераций
	l = 0; 	      % Инициализируем счетчик вычислений функции
  x_temp = [];  % Инициализируем вектор приближенных значений минимума
  dx = left : (right - left)/n : right; % Генерируем сетку
  
	% Пока длина сегмента локализации больше требуемой точности
	while (right - left > 2 * epsilon)
		
		% Вычисляем потенциально новые концы сегмента локализации
		left_new  = (left + right) / 2 - alpha;
		right_new = (left + right) / 2 + alpha;
		
		% Вычисляем значение функции в этих точках
		f_left_new  = f(left_new);
		f_right_new = f(right_new);
		l += 2;	% Инкрементируем счетчик вычислений функции
		
		% Определяем концы нового сегмента локализации
		if (f_left_new > f_right_new)
			left = left_new;
		else
			right = right_new;
		end
    
    % Добавляем в вектор приближений текущую точку минимума
    x_temp = [x_temp; (left + right) / 2];
    
		k += 1;	% Инкрементируем счетчик итераций
    
	end
	  
	x_final = x_temp(end);	% Определяем последнее найденное приближение точки минимума
  x_temp(end) = [];       % Удаляем его из вектора приближений, чтобы не отрисовывать дважды
	
  % Строим график
  figure('Name','Dichotomy minimization method','NumberTitle','off'), 
  plot(dx, f(dx), '-b', x_final, f(x_final), 'ro', x_temp, f(x_temp), 'kx');
  legend('Objective function', 'Final minimum point', 'Intermediate minimum points');
  
  % Добавляем метки к неокончательным приближениям минимума с номерами итераций, на которых они были получены
  for i = 1 : length(x_temp)
    text(x_temp(i), f(x_temp(i)), sprintf('%d', i), 'VerticalAlignment','top','HorizontalAlignment','left');
  end
  
	% Выводим результаты в консоль
	printf("Minimum:       \t%d\nFunction value:\t%d\nIterations:    \t%d\nCalls:         \t%d\n", x_final, f(x_final), k, l);
	
end
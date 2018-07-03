function dichotomy_minimization
  
  f = str2func(strcat('@(x) ', input('- Objective function handle: @(x) ', 's')));  % Считываем и генерируем хэндл целевой функции  
	left  = input('- Left end of the segment:  ');  % Левый конец сегмента локализации
	right = input('- Right end of the segment: ');  % Правый конец сегмента локализации
	epsilon = input('- Desired precision:  ');  % Требуемая точность
  
  alpha = 0.001;	% Константа различимости	
  
  k = 0;	% Инициализируем счетчик итераций
	l = 0;	% Инициализируем счетчик вычислений функции
  
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
    
		k += 1;	% Инкрементируем счетчик итераций
    
	end
	
  % Вычисляем точку минимума
	x = (left + right) / 2;	
	
	% Выводим результаты в консоль
	printf("Minimum:       \t%d\nFunction value:\t%d\nIterations:    \t%d\nCalls:         \t%d\n", x, f(x), k, l);
	
end
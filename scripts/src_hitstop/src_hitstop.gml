global.hitstop = false; // variavel para controlar hitstop

// função para ativar hitstop
function activate_hitstop(_time = game_get_speed(gamespeed_fps)/2)
{
	global.hitstop = true;
	
	// garantindo que mu objeto hitstop exita
	if !instance_exists(obj_hitstop_maneger)
		instance_create_depth(0, 0, 0, obj_hitstop_maneger);
		
	obj_hitstop_maneger.time_hitstop = _time;
}

// função para pegar o movimento do background
function get_background()
{
	var _layer = layer_get_all(); 
	var _lenght_layer = array_length(_layer)-1;
	var _bg_layers = []; // variavel que vai guardar minha backgrounds
	
	for(var i = 0; i <= _lenght_layer; i++)
	{
		var _current_index = _layer[i]; // meu indice atual
		var _layer_bg_id_filter = layer_background_get_id(_current_index); // layer que tem o id background
		
		// filtranto somente as layer que tem background
		if (_layer_bg_id_filter != -1)
		{	
			// pegando os nomes das layers filtradas
			var _bg_layer_name = layer_get_name(_current_index);  
			// guardando as layer que tem background
			array_push(_bg_layers, _bg_layer_name); 
		}
	}
	
	return _bg_layers;
}

// função para parar fazer o hitstop do background
function hitstop_bg(_layers_bg, _hs, _vs)
{
	var _qtd = array_length(_layers_bg);
	
	if global.hitstop
	{
		for (var i = 0; i < _qtd; i++)
		{ 
			var _current_layer = _layers_bg[i];
		
			var _hspeed = layer_get_hspeed(_current_layer);
			var _vspeed = layer_get_vspeed(_current_layer);
		
			array_push(_hs, _hspeed);
			array_push(_vs, _vspeed);
		
			layer_hspeed(_current_layer, 0);
			layer_vspeed(_current_layer, 0);
		}
	}else
	{
		for (var i = 0; i < _qtd; i++)
		{ 
			var _current_layer = _layers_bg[i];
		
			layer_hspeed(_current_layer, _hs[i]);
			layer_vspeed(_current_layer, _vs[i]);
		}
	}
		
}


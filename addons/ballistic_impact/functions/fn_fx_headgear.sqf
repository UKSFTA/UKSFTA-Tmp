fnc_helmetTrashed = 
{
	if (!hasInterface) exitWith {};       
	private _object = _this;             
	private _pArray = [];             
	for "_i" from 0 to random 3 do             
	{             
		private _parca = "#particlesource" createVehicleLocal (getPosATL _object);              
		_parca setParticleClass "goggleparts";              
		_parca setParticleParams             
		[             
			["\A3\data_f\ParticleEffects\Shard\shard3", 1, 0, 1], //shape name             
			"", //animation name             
			"SpaceObject", //type             
			1, 2 + random 5, //timer period & life time             
			[0, 0, 0], //position             
			[3 + random -6, 3 + random -6,1 + random 6], //moveVeocity             
			1 + random 4, 1, 0.1, 0, //rotation velocity, weight, volume, rubbing             
			[0.4 + random 0.3], //size             
			[[1,1,1,1]], //color             
			[0.1], //animationPhase (animation speed in config)             
			0.1, //randomdirection period             
			0.05, //random direction intensity             
			"", //onTimer             
			"", //before destroy             
			"", //object             
			0, //angle             
			false, //on surface             
			0 //bounce on surface             
		];             
		_parca setParticleRandom [0, [0, 0, 0], [0, 0, 1], 0, 0.1, [0, 0, 0, 0], 0, 0];             
		_parca setDropInterval 1000;             
		_parca attachTo [_object,[0,-0.05,0.18],"head"];              
		_pArray pushBack _parca;             
	};             
};

fnc_helmetDestroyed = 
{
	if (!hasInterface) exitWith {};
	private _object = _this select 0;
	private _velocity = _this select 1;
	private _pArray = [];
	for "_i" from 0 to random 3 do
	{            
		private _parca = "#particlesource" createVehicleLocal (getPosATL _object);
		_parca setParticleClass "goggleparts";
		_parca setParticleParams
		[
			["\A3\data_f\ParticleEffects\Shard\shard3", 1, 0, 1], //shape name
			"", //animation name
			"SpaceObject", //type
			1, 5, //timer period & life time
			[0, 0, 0], //position
			_velocity, //moveVeocity
			1 + random 4, 1, 0.1, 0, //rotation velocity, weight, volume, rubbing
			[0.4 + random 0.3], //size
			[[1,1,1,1]], //color            
			[0.1], //animationPhase (animation speed in config)
			0.1, //randomdirection period
			0.05, //random direction intensity
			"", //onTimer
			"", //before destroy
			"", //object
			0, //angle
			false, //on surface
			0 //bounce on surface
		];
		_parca setParticleRandom [0, [0, 0, 0], [0, 0, 1], 0, 0.1, [0, 0, 0, 0], 0, 0];
		_parca setDropInterval 1000;
		_parca attachTo [_object,[0,-0.05,0.18],"head"];
		_pArray pushBack _parca;
	};
};

fnc_FlyOff = 
{      
	if (!hasInterface) exitWith {};                   
	private _object = _this select 0;
	private _velocity = _this select 1;                       
	private _helmet = headgear _object;          
	private _modelname = getText (configFile >> "CfgWeapons" >> _helmet >> "model");             
	private _parca = "#particlesource" createVehicleLocal (getPosATL _object);                         
	_parca setParticleClass "helmetflyoff";
	_parca setParticleParams                        
	[                        
		[_modelname, 1, 0, 1], //shape name                        
		"", //animation name                        
		"SpaceObject", //type                        
		0, 3, //timer period & life time                        
		[0, 0, 0], //position                        
		_velocity, //moveVeocity                        
		0.2, 1, 0.1, 1, //rotation velocity, weight, volume, rubbing                        
		[0.9], //size                        
		[[1,1,1,1], [0,0,0,0]], //color                        
		[10], //animationPhase (animation speed in config)                        
		0, //randomdirection period                        
		0, //random direction intensity                        
		"", //onTimer                        
		"", //before destroy                        
		"", //object                        
		0, //angle                        
		false, //on surface                        
		0, //bounce on surface              
		[[1,0,0,0]]           
	];                        
	_parca setDropInterval 8000;                        
	_parca attachTo [_object,[0,0,0],"head"];                         
};

fnc_helmetSparks1 = 
{
	if (!hasInterface) exitWith {};             
	private _object = _this select 0;
	private _velocity = _this select 1;                
	private _bArray = [];                 
	private _blood = "#particlesource" createVehicleLocal (getPosATL _object);                  
	_blood setParticleClass "goggleparts";                  
	_blood setParticleParams         
	[        
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 3, 12, 4],  //sprite name        
		"", //animation name        
		"Billboard", //type        
		0.5, 1.4, //timer period and fadeout timer        
		[0, 0, 0], //position        
		_velocity, //move velocity        
		1, 1, 0.35,  0.80, //rot vel, weight, volume, rubbing        
		[0.08,0.01], //size transform        
		[[1,1,1,0], [0.1,0.1,0.1,-4], [0,0,0,-4],[1,1,1,1]],  //color and transperency        
		[1000], //animation phase speed        
		0.2,   //randomdirection period        
		0.7,  //randomization intensity        
		"", //onTimer        
		"",  //beforeDestroy        
		"",  //object        
		360,  //angle        
		false,  //on the surface        
		0  //bounce         
	];          
	_blood setDropInterval 0.001;         
	_blood attachTo [_object,[0,0,0.04],"neck"];                  
	_bArray pushBack _blood;                 
	_bArray spawn                  
	{                 
		private _bArray = _this;                 
		sleep 0.08;                 
		{ deleteVehicle _x } forEach _bArray;                 
	};               
};

fnc_helmetSparks2 = 
{    
	if (!hasInterface) exitWith {};              
	private _object = _this select 0;
	private _velocity = _this select 1;             
	private _bArray = [];                 
	private _blood = "#particlesource" createVehicleLocal (getPosATL _object);                  
	_blood setParticleClass "goggleparts";                  
	_blood setParticleParams         
	[     
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 4, 11, 4],  //sprite name        
		"", //animation name        
		"Billboard", //type        
		0.5, 1.4, //timer period and fadeout timer        
		[0, 0, 0], //position        
		_velocity, //move velocity        
		1, 1, 0.35,  0.80, //rot vel, weight, volume, rubbing        
		[0.08,0.01], //size transform        
		[[1,1,1,0], [0.1,0.1,0.1,-4], [0,0,0,-4],[1,1,1,1]],  //color and transperency        
		[1000], //animation phase speed        
		0.2,   //randomdirection period        
		0.7,  //randomization intensity        
		"", //onTimer        
		"",  //beforeDestroy        
		"",  //object        
		360,  //angle        
		false,  //on the surface        
		0  //bounce         
	];          
	_blood setDropInterval 0.001;         
	_blood attachTo [_object,[0,0,0.04],"neck"];                  
	_bArray pushBack _blood;                 
	_bArray spawn                  
	{                 
		private _bArray = _this;                 
		sleep 0.1;                 
		{ deleteVehicle _x } forEach _bArray;                 
	};               
};   

fnc_helmetSparks3 = 
{
	if (!hasInterface) exitWith {};           
	private _object = _this select 0;
	private _velocity = _this select 1;              
	private _bArray = [];                  
	private _blood = "#particlesource" createVehicleLocal (getPosATL _object);                   
	_blood setParticleClass "goggleparts";                   
	_blood setParticleParams          
	[         
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 6, 0, 4],  //sprite name         
		"", //animation name         
		"Billboard", //type         
		0.5, 1.4, //timer period and fadeout timer         
		[0, 0, 0], //position         
		_velocity, //move velocity         
		1, 1, 0.35,  0.80, //rot vel, weight, volume, rubbing         
		[0.08,0.01], //size transform         
		[[1,1,1,0], [0.1,0.1,0.1,-4], [0,0,0,-4],[1,1,1,1]],  //color and transperency         
		[1000], //animation phase speed         
		0.2,   //randomdirection period         
		0.7,  //randomization intensity         
		"", //onTimer         
		"",  //beforeDestroy         
		"",  //object         
		360,  //angle         
		false,  //on the surface         
		0  //bounce          
	];           
	_blood setDropInterval 0.001;          
	_blood attachTo [_object,[0,0,0.04],"neck"];                   
	_bArray pushBack _blood;                  
	_bArray spawn                   
	{                  
		private _bArray = _this;                  
		sleep 0.1;                  
		{ deleteVehicle _x } forEach _bArray;                  
	};                
};     

fnc_helmetSparks4 = 
{    
	if (!hasInterface) exitWith {};   
	private _object = _this select 0;
	private _velocity = _this select 1;                
	private _bArray = [];                  
	private _blood = "#particlesource" createVehicleLocal (getPosATL _object);                   
	_blood setParticleClass "goggleparts";                   
	_blood setParticleParams          
	[         
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 1, 0, 4],  //sprite name         
		"", //animation name         
		"Billboard", //type         
		0.5, 1.4, //timer period and fadeout timer         
		[0, 0, 0], //position         
		_velocity, //move velocity         
		1, 1, 0.35,  0.80, //rot vel, weight, volume, rubbing         
		[0.08,0.01], //size transform         
		[[1,1,1,0], [0.1,0.1,0.1,-4], [0,0,0,-4],[1,1,1,1]],  //color and transperency         
		[1000], //animation phase speed         
		0.2,   //randomdirection period         
		0.7,  //randomization intensity         
		"", //onTimer         
		"",  //beforeDestroy         
		"",  //object         
		360,  //angle         
		false,  //on the surface         
		0  //bounce          
	];           
	_blood setDropInterval 0.001;          
	_blood attachTo [_object,[0,0,0.04],"neck"];                   
	_bArray pushBack _blood;                  
	_bArray spawn                   
	{                  
		private _bArray = _this;                  
		sleep 0.1;                  
		{ deleteVehicle _x } forEach _bArray;                  
	};                
};

function ArrayJs(arg) constructor
{
    values = arg;

    static push = function(value)
    {
		array_push(values,value);
    }
	static pop = function()
    {
		return array_pop(values);
    }
	static splice = function(index, n)
    {
		var aux = [];
		if((index + n) > array_length(values))
			n = 0
		for(var i = index; i < (index+n); i++){
			array_push(aux,values[i]);
		}
		array_delete(values,index,n);
		return new ArrayJs(aux);
    }
	
	static slice = function(initialIndex, n)
    {
		var aux = [];
		var finalIndex = initialIndex + n;
		if(finalIndex > array_length(values) || finalIndex < initialIndex)
			finalIndex = array_length(values);
		for(var i = initialIndex; i < finalIndex; i++){
			array_push(aux,values[i]);
		}
		return new ArrayJs(aux);
    }
	
	static reverse = function()
    {
		var aux = [];
		for(var i = array_length(values)-1; i  >= 0; i--){
			array_push(aux,values[i]);
		}
		return new ArrayJs(aux);
    }	
	static map = function(customFunc)
    {
		var aux = [];
		for(var i = 0; i < array_length(values); i++){
			array_push(aux,customFunc(values[i],i))
		}
		return new ArrayJs(aux);
    }
	
	static some = function(customFunc)
    {
		var aux = false;
		for(var i = 0; i < array_length(values); i++){
			aux = customFunc(values[i],i);
			if(aux == true)
				i = array_length(values);
		}
		return aux
    }
	
	static filter = function(customFunc)
    {
		var aux = [];
		var auxBool = false
		for(var i = 0; i < array_length(values); i++){
			auxBool = customFunc(values[i],i);
			if(auxBool == true)
				array_push(aux,values[i])
		}
		return new ArrayJs(aux);
    }
	
	static join = function(customFunc)
    {
		return null;
    }
	static split = function(customFunc)
    {
		return null;
    }
	static sort = function(customFunc)
    {
		return array_sort(values,customFunc);
    }
	static lastIndex = function()
    {
		if(array_length(values) > 0)
			return array_length(values) - 1;
		else{
			return 0;
		}
    }
	static jsLength = function()
    {
		return array_length(values);
    }
	static indexOf = function(value)
    {
		var valueAux = -1;
		for(var i = 0; i < array_length(values); i++){
			if(values[i] == value){
				valueAux = i;
				i = array_length(values);
			}
		}
		return valueAux
    }
	static hasIndex = function(index)
    {
		var valueAux = false;
		if(array_length(values) > index)
			valueAux = true;
		return valueAux
    }
	
}
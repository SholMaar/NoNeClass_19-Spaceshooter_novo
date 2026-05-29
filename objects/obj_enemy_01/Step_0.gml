enemy_01_shooting();

// me destruindo se cheguei no final da sequencia
if (creat_in_sequence && !in_sequence)
{
	instance_destroy(id, false); 
}
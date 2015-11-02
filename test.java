package example.PACKAGE.com;

import people;
import com.compiler.example;

/**
* Classe para testes..
*/
public class TestClass
{
	/*Test declaration variables*/
	String name;
	final int cpf;
	boolean f = true;
	
	/*Test Constructor*/
	public TestClass(String name, int cpf)
	{
		this.name = name;
		this.cpf = cpf;
		int x = 10, y = 20;
		int z = y+x;
	}
	/*Test creating Methods*/
	String getName()
	{
		return name;
	}

	int getCPF()
	{
		return cpf;
	}

	void setName(String name)
	{
		this.name = name;
	}

	void setCPF(int cpf)
	{
		this.cpf = cpf;
	}

	void methodForTestForAndWhile()

	{	//test if condition...
		if(cpf == 1234)
		{
			for(int i = 0; i < 10; i+=1)
			{/*OK*/}
		}
		else
		{
			while(true)
			{/*OK*/}
		}
	}
}


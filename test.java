package example.PACKAGE.com;

import people;
import com.compiler.example;

/**
* Class for tests..
*/

public class TestClass
{
	/*Test declaration variables*/
	String name;
	final int cpf;
	char i;
	double s;
	boolean g = true;
	double ss;
	short a;
	aaaaa;

	break;

	/*Test Constructor*/
	public TestClass(String name, int cpf)
	{
		this.name = name;
		this.cpf = cpf;
		int x = 10, y = 20;
		f = 20;
		double z = 10 + 20;
	}
	/*Test creating Methods*/
	public String getName()
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
			{/*OK*/
				break;
			}
		}
		else
		{
			while(true)
			{/*OK*/}
		}
	}
}


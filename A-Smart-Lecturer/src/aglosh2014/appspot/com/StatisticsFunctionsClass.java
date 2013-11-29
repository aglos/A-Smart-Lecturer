package aglosh2014.appspot.com;

public class StatisticsFunctionsClass {

	
	public double getMax(double []a)
	{

		double temp=a[0];
		for(int i=0 ; i<a.length ; i++)
		{
			if(a[i]>temp)
				temp=a[i];
		}
		return temp;
	}

	public double getMin(double []a)
	{

		double temp=a[0];
		for(int i=0 ; i<a.length ; i++)
		{
			if(a[i]<temp)
				temp=a[i];
		}
		return temp;
	}


	public double getAvg(double []a)
	{
		double temp=0;
		for(int i=0 ; i<a.length ; i++)
		{
			temp=temp+a[i];
		}
		temp=temp/a.length;
		return temp;
	}

	public double[] Distribution(double []a)
	{
		double[] temp=new double[10];

		for(int i=0 ; i<temp.length ; i++)
		{
			temp[i]=0;
		}

		for(int i=0 ; i<a.length ; i++)
		{
			if(a[i]>=0 && a[i]<10)
				temp[0]++;

			if(a[i]>=10 && a[i]<20)
				temp[1]++;

			if(a[i]>=20 && a[i]<30)
				temp[2]++;

			if(a[i]>=30 && a[i]<40)
				temp[3]++;

			if(a[i]>=40 && a[i]<50)
				temp[4]++;

			if(a[i]>=50 && a[i]<60)
				temp[5]++;

			if(a[i]>=60 && a[i]<70)
				temp[6]++;

			if(a[i]>=70 && a[i]<80)
				temp[7]++;

			if(a[i]>=80 && a[i]<90)
				temp[8]++;

			if(a[i]>=90 && a[i]<=100)
				temp[9]++;
		}

		for(int i=0 ; i<temp.length ; i++)
		{
			temp[i]=(temp[i]/a.length)*100;
		}


		return temp;
	}
	
	
	public double StandardDeviation(double []a)
	{
		double avg=getAvg(a);
		double sd=0;

		for(int i=0 ; i< a.length ; i++)
		{
			sd=sd+Math.pow(a[i]-avg, 2);
		}
		
		
		double x=(a.length-1);
		x=1/x;
		
		sd=sd*x;	
		sd=Math.sqrt(sd);
		
		return sd;
	}



}
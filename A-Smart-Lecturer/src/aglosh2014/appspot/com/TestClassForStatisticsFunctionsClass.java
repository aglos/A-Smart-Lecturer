package aglosh2014.appspot.com;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

// all compared values were tested in exterior calculators

public class TestClassForStatisticsFunctionsClass {

	private StatisticsFunctionsClass statisticsFunctions;
	
	//array a for test
	private double []a={10,20,30,40,50,60,70,80,90,100,11,21,31,41,51,61,71,81,91,100};
	private double []Distribution_a={0 ,10.00 ,10.00 ,10.00 ,10.00 ,10.00 ,10.00 ,10.00 ,10.00 ,20.00};
	
	//array b for test
	private double[] b={0 ,15 , 5 ,9 ,99 ,3 ,65 ,22 ,47 ,96, 27 ,10 ,80 ,88 ,100 , 30 ,97 ,45 ,12 ,36 ,54 ,14 ,43 ,68 ,67 ,95 ,84 ,21};
	private double []Distribution_b={14.29 , 14.29 ,10.71 ,7.14 ,10.71 , 3.57 , 10.71 , 0 , 10.71 , 17.86};
	
	@Before
	public void init()
	{
		statisticsFunctions=new StatisticsFunctionsClass();
	}
	
	// testers for a array
	@Test
	public void testGetmax_a() {
		assertEquals(100, statisticsFunctions.getMax(a), 0.00);
	}
	
	@Test
	public void testGetMin_a() {
		assertEquals(10, statisticsFunctions.getMin(a), 0.00);
	}
	
	@Test
	public void testGetAvg_a() {
		assertEquals(55.45, statisticsFunctions.getAvg(a), 0.01);
	}
	
	@Test
	public void testDistribution_a() {
		assertArrayEquals(Distribution_a, statisticsFunctions.Distribution(a), 0.01);
	}
	
	@Test
	public void StandardDeviation_a() {
		assertEquals(29.392, statisticsFunctions.StandardDeviation(a), 0.001);
	}
	
	
	// testers for b array
	@Test
	public void testGetmax_b() {
		assertEquals(100, statisticsFunctions.getMax(b), 0.00);
	}
	
	@Test
	public void testGetMin_b() {
		assertEquals(0, statisticsFunctions.getMin(b), 0.00);
	}
	
	@Test
	public void testGetAvg_b() {
		assertEquals(47.57143, statisticsFunctions.getAvg(b), 0.0001);
	}
	
	@Test
	public void testDistribution_b() {
		assertArrayEquals(Distribution_b, statisticsFunctions.Distribution(b), 0.01);
	}
	
	@Test
	public void StandardDeviation_b() {
		assertEquals(34.56227, statisticsFunctions.StandardDeviation(b), 0.0001);
	}

}

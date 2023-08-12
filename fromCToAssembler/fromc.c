#include <stdio.h>
#include <string.h>
extern int r_area(int, int);
extern int r_circum(int, int);
extern double c_area(double);
extern double c_circum(double);
extern void sreverse(char *, int);
extern void adouble(double[], int);
extern double asum(double[], int);
double pi = 3.141592654;
int main() {
  char rstring[64];
  int side1, side2, rarea, rcircum;
  double radius, carea, ccircum;
  double darray[] = {70.0, 83.2, 91.5, 72.1, 55.5};
  long int len;
  double sum;
  // int
  printf("Compute area and circumference of a rectangle\n");
  printf("Enter the length of on side: \n");
  scanf("%d", &side1);
  printf("Enter the length of the oother side: \n");
  scanf("%d", &side2);

  rarea = r_area(side1, side2);
  rcircum = r_circum(side1, side2);

  printf("The area of the rectangle = %d\n", rarea);
  printf("The circumference of the rectangle = %d\n\n", rcircum);

  // 使用双精度浮点数参数调用汇编函数
  printf("Compute area and circumference of a circle\n");
  printf("Enter the radius:\n");
  scanf("%lf", &radius);

  carea = c_area(radius);
  ccircum = c_circum(radius);
  printf("The area of the circle = %lf\n", carea);
  printf("The circumference of the circle = %lf\n", ccircum);

  // 使用字符串参数的调用汇编函数
  printf("Reversea a string\n");
  printf("Enter the string:\n");
  scanf("%s", rstring);
  printf("The string is = %s\n", rstring);
  sreverse(rstring, strlen(rstring));
  printf("The reversed string is = %s\n", rstring);

  // 使用数组参数调用汇编函数
  printf("Some array manipulationa\n");
  len = sizeof(darray) / sizeof(double);

  printf("The array has %lu elements\n", len);
  printf("The elements of the array are: \n");
  for (int i = 0; i < len; i++) {
    printf("Element %d = %lf\n", i, darray[i]);
  }

  sum = asum(darray, len);
  printf("The sum of the elements of this array = %lf\n", sum);

  adouble(darray, len);
  printf("The elements of the doubled array are: \n");
  for (int i = 0; i < len; i++) {
    printf("Element %d = %lf\n", i, darray[i]);
  }
  sum = asum(darray, len);
  printf("The sum of the elements of this doubled array = %lf\n", sum);
  return 0;
}
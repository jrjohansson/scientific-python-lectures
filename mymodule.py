"""
Example of a python module. Contains a variable called my_variable,
a function called my_function, and a class called MyClass.
"""

my_variable = 2

def my_function():
    """
    Example function: return the square of my_variable
    """
    return my_variable ** 2
    
class MyClass:
    """
    Example class.
    """

    def __init__(self):
        self.variable = my_variable
        
    def set_variable(self, new_value):
        self.variable = new_value
        
    def get_variable(self):
        return self.variable

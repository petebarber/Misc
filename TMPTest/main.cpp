//
//  main.cpp
//  TMPTest
//
//  Created by Pete on 17/07/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

#include <iostream>
#include <memory>
#include <string>

class IFoo
{
public:
	virtual void Execute() const =0;
};

class Foo : public IFoo
{
public:
	static std::string Name() { return "Foo"; }
	
	Foo()
	{
		
	}
	
	void Execute() const { std::cout << Foo::Name() << '\n'; }
};

class Bar : public IFoo
{
public:
	static std::string Name() { return "Bar"; }
	
	Bar(int)
	{
		
	}
	void Execute() const { std::cout << Bar::Name() << '\n'; }
};

class Baz : public IFoo
{
public:
	static std::string Name() { return "Baz"; }
	void Execute() const { std::cout << Baz::Name() << '\n'; }
};

class NullType
{
public:
	static std::string Name() { return ""; }
};

template<typename HEAD, typename TAIL>
struct TypeList
{
	using head = HEAD;
	using tail = TAIL;
};

using MyTypes = TypeList<Foo, TypeList<Bar, TypeList<Baz, NullType>>>;

template<typename T, typename... ARGS>
std::unique_ptr<IFoo> MakeHelper(ARGS&&... args)
{
	std::cout << "Can construct " << T::Name() << " with args:";
	
	if (std::is_constructible<T, ARGS...>::value == true)
		std::cout << "yes\n";
	else
		std::cout << "no\n";

	return nullptr;
}

template<typename T> bool ReachedEnd() { return false; }
template<> bool ReachedEnd<NullType>() { return true; }


template<typename T, typename... ARGS>
std::unique_ptr<IFoo> Make(const std::string& name, ARGS&&... args)
{
	if (ReachedEnd<T>() == true)
		return nullptr;
	
	if (T::head::Name() == name)
	{
		MakeHelper<typename T::head, ARGS...>(std::forward<ARGS>(args)...);
		return nullptr;
	}
	else
		return Make<typename T::tail, ARGS...>(name, std::forward<ARGS>(args)...);
}

template<>
std::unique_ptr<IFoo> Make<NullType>(const std::string& name)
{
	return nullptr;
}

template<typename... ARGS> void count()
{
	std::cout << "#args:" << sizeof...(ARGS) << '\n';
}

int main(int argc, const char * argv[])
{
	count<MyTypes, int, double>();
	Make<MyTypes>("Foo", 1,2 ); //->Execute();
	Make<MyTypes>("Bar"); //->Execute();
	//Make<MyTypes>("Bonzo")->Execute();
	// insert code here...
	std::cout << "Hello, World!\n";
    return 0;
}


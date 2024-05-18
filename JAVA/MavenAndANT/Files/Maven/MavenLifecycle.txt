Maven Lifecycles

	-Clean
		-pre-clean
		-clean
		 ...
	-Build (default)
		-validate
		-compile
		-test
		-package
		-verify
		-install
		-deploy
		 ...
	-Site
		-site
		 ...


CMD
===

mvn install
mvn clean install

Syntax to invoke a goal
=======================
mvn groupId:artifactId:version:goal
Example : mvn com.company:myown-plugin:1.0:goalname



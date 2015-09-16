# Parent POM's for 52°North [![Build Status](https://travis-ci.org/52North/maven-parents.svg?branch=master)](https://travis-ci.org/52North/maven-parents)

# Usage

To apply the 52°North parent pom in your project, add the following to your project's `pom.xml` file.

```xml
<parent>
    <groupId>org.n52</groupId>
    <artifactId>parent</artifactId>
    <version>1-SNAPSHOT</version>
</parent>
```

# Deployment

Put your [Sonatype OSS](https://oss.sonatype.org/) credentials into your `.m2/settings.xml` like this:

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                              http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <servers>
        <server>
            <id>ossrh</id>
            <username>$username</username>
            <password>$password</password>
        </server>
    </servers>
</settings>
```

## Snapshot

Shouldn't be needed in most cases, as `master` is automatically deployed, but just in case:
```sh
mvn deploy
```

## Release
```sh
mvn release:prepare
mvn release:perform -P sign
```

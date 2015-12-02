lazy val meta = """META.INF(.)*""".r

resolvers += Resolver.sonatypeRepo("public")

lazy val root = (project in file(".")).
  settings(
    name := "ml-cuisine-prediction",
    version := "0.1.0",
    scalaVersion := "2.10.6",
    libraryDependencies ++= Seq(
          "org.json4s" %% "json4s-jackson" % "3.2.9",
          "org.apache.spark" %% "spark-core" % "1.5.1" % "provided",
          "com.github.scopt" %% "scopt" % "3.3.0",
          "org.apache.spark" %% "spark-mllib" % "1.5.1"
    )
  )

assemblyMergeStrategy in assembly := {
  case meta(_) | "UnusedStubClass.class"
    => MergeStrategy.discard
  case x
    => MergeStrategy.first
}

/*
artifact in (Compile, assembly) := {
  val art = (artifact in (Compile, assembly)).value
  art.copy(`classifier` = Some("assembly"))
}

addArtifact(artifact in (Compile, assembly), assembly)

publishTo := {
  val artifactory = "http://artifactory.lunatech.com/artifactory/"
  if (version.value.trim.endsWith("SNAPSHOT"))
    Some("snapshots" at artifactory + "ing-snapshots")
  else
    Some("releases" at artifactory + "ing-releases")
}

credentials += Credentials(Path.userHome / ".ing" / ".credentials")
*/


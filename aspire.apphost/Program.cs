var builder = DistributedApplication.CreateBuilder(args);

var backend = builder.AddProject<Projects.backend>("backend")
   .WithExternalHttpEndpoints();

builder.AddNpmApp("frontend", "../frontend")
    .WithReference(backend)
    .WaitFor(backend)
    .WithHttpEndpoint(env: "PORT")
    .WithExternalHttpEndpoints()
    .PublishAsDockerFile();

builder.Build().Run();

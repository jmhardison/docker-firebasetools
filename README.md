# Docker - Firebase Tools

This image provides the latest firebase tools with an entrypoint desired to fire off a deploy.
Mount in your volumes, launch, and enjoy.

Command inside image:
`firebase deploy --token $(fb_ci_token) --project $(fb_projectid) --message "Release: $(Build.BuildId)"`

Volume mount should be to: `/opt/work`
Environment variables needed:
* `fb_ci_token` - CLI Token for calling api.
* `fb_projectid` - Project ID for Firebase project.
* `fb_releasemessage` - Release message you want in the deployment. For example, you could pass in your build id.

As an example for an azure pipeline, this task would execute the container with appropriate volumes and envVars:

```yaml
    - task: Docker@0
      displayName: 'Run Firebase Deploy'
      inputs:
        containerRegistryType: 'Container Registry'
        action: 'Run an image'
        imageName: 'jhardison/firebasetools:latest'
        volumes: |
          $(build.sourcesDirectory)/extract:/opt/work
        detached: false
        envVars: |
          fb_ci_token=$(fb_ci_token)
          fb_projectid=$(fb_projectid)
          fb_releasemessage=$(Build.BuildId)
```


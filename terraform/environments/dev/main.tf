terraform {
  cloud {
    organization = "brianpham"

    workspaces {
      name = "dev"
    }
  }
}
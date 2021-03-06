import Gift
import LlamaKit
import Quick
import Nimble

class Commit_BranchSpec: QuickSpec {
  override func spec() {
    describe("createBranch") {
      var repository: Result<Repository, NSError>!
      var commit: Result<Commit, NSError>!
      beforeEach {
        repository = openFixturesRepository("Commit+BranchSpec_OneBranchBesidesMaster")
        commit = repository.map { $0.commits().array[0] }
      }

      context("when a branch doesn't already exist with the given name") {
        it("creates a new branch") {
          expect(commit.flatMap { $0.createBranch("brownsville") }.flatMap { $0.name })
            .to(haveSucceeded("refs/heads/brownsville"))
        }
      }
    }
  }
}

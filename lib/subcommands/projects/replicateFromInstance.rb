class ReplicateFromInstance < Subcommand

  attr_reader :rundeck_instance, :subcommand_action, :subcommand_full, :description, :cmd_example

  def initialize(target=nil)

    @rundeck_instance = target
    @subcommand_action = "replicateFromInstance"
    @subcommand_full = "projects #{subcommand_action}"
    @cmd_example = "#{subcommand_full} rundeck.foo.bar"
    @description = "Replicate Rundeck projects from another Rundeck instance, this action remove all existent project on the local Instance"

  end

  def run

    puts "Running #{subcommand_full} #{rundeck_instance}"

    rundeck = Rundeck.new(rundeck_instance)
    rundeck.projects_to_zip(@@tmp_directory)

    rundeck = Rundeck.new
    rundeck.projects_import(@@tmp_directory)

  end


end

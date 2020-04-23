module JobsHelper
  def get_job_data()
    debugger
    JSON.parse(File.read("public/jobs/jobs.json"))
  end
end

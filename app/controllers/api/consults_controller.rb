class Api::ConsultsController < Api::BaseController

  def index
    render status: 200,
    ok: true,
    json: {
        data: Consult.all
      }
  end

  def show
    consult = Consult.find_by(id: params[:id])

    if consult.present?
      render status: 200,
        ok: true,
        json: {
        data: consult
        }
    else
      head({  :status => 404,
              :ok => false
      })
    end
  end

  def create
    consult = Consult.new(consult_params)

    if consult.save()
      render status: 200,
      ok: true,
      json: {
        data: consult
      }
    else
      render status: 422,
      ok: false,
      json: {
        errors: consult.errors.full_messages
      }
    end
  end
  def consult_params
     params.permit(:description, :patient_id)
  end
end
